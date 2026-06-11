import 'dart:async';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/game_state.dart';
import '../models/worker.dart';
import '../models/upgrade.dart';
import '../core/constants.dart';
import '../services/storage_service.dart';

class GameData {
  final GameState gameState;
  final List<Worker> workers;
  final List<Upgrade> upgrades;

  GameData({
    required this.gameState,
    required this.workers,
    required this.upgrades,
  });

  GameData copyWith({
    GameState? gameState,
    List<Worker>? workers,
    List<Upgrade>? upgrades,
  }) {
    return GameData(
      gameState: gameState ?? this.gameState,
      workers: workers ?? List.unmodifiable(this.workers),
      upgrades: upgrades ?? List.unmodifiable(this.upgrades),
    );
  }

double get goldPerSecond {
    double totalIncome = 0;
    for (final worker in workers) {
      totalIncome += worker.baseIncome * worker.count;
    }
    double multiplier =
        gameState.depthMultiplier.toDouble() * gameState.prestigeMultiplier;
    final now = DateTime.now().millisecondsSinceEpoch;
    if (gameState.multiplierEndTime != null && now < gameState.multiplierEndTime!) {
      multiplier *= 2;
    }
    for (final upgrade in upgrades) {
      if (upgrade.id == 'ore_shield') {
        multiplier += (multiplier * upgrade.level * 0.20);
      }
    }
    return totalIncome * multiplier;
  }
}

class GameNotifier extends StateNotifier<GameData> {
  final StorageService _storage = StorageService.instance;
  Timer? _incomeTimer;
  Timer? _autoTapTimer;
  Timer? _saveTimer;
  bool _isSaving = false;
  double _fractionalGold = 0.0;

  static const List<int> depthCosts = GameConfig.depthCosts;

  GameNotifier()
      : super(GameData(
          gameState: GameState(),
          workers: _defaultWorkers(),
          upgrades: _defaultUpgrades(),
        )) {
    _init();
  }

  static List<Worker> _defaultWorkers() => [
        Worker(
            id: 'dwarf',
            name: 'Гном',
            baseIncome: 1,
            baseCost: 10,
            depthRequired: 1,
            emoji: '🧌'),
        Worker(
            id: 'fire_golem',
            name: 'Огненный голем',
            baseIncome: 5,
            baseCost: 100,
            depthRequired: 2,
            emoji: '🔥'),
        Worker(
            id: 'crystal_elemental',
            name: 'Кристальный элементаль',
            baseIncome: 20,
            baseCost: 500,
            depthRequired: 3,
            emoji: '💎'),
        Worker(
            id: 'shadow_mage',
            name: 'Теневой маг',
            baseIncome: 100,
            baseCost: 2000,
            depthRequired: 4,
            emoji: '🌑'),
        Worker(
            id: 'golden_dragon',
            name: 'Золотой дракон',
            baseIncome: 500,
            baseCost: 10000,
            depthRequired: 5,
            emoji: '🐉'),
      ];

  static List<Upgrade> _defaultUpgrades() => [
        Upgrade(
            id: 'pickaxe',
            name: 'Магическая кирка',
            maxLevel: 5,
            baseCost: 50,
            description: '+1 к силе тапа'),
        Upgrade(
            id: 'luck',
            name: 'Шахтёрская удача',
            maxLevel: 8,
            baseCost: 50,
            description: '+5% к шансу крита'),
        Upgrade(
            id: 'auto_tap',
            name: 'Авто-тап',
            maxLevel: 1,
            baseCost: 50,
            description: 'Авто-тап каждые 3 секунды'),
        Upgrade(
            id: 'ore_shield',
            name: 'Щиток руды',
            maxLevel: 10,
            baseCost: 200,
            description: '+20% к доходу рабочих',
            effectType: 1,
            effectValue: 20),
        Upgrade(
            id: 'quality_steel',
            name: 'Качественная сталь',
            maxLevel: 5,
            baseCost: 500,
            description: '-5% к цене рабочих',
            effectType: 2,
            effectValue: 5),
        Upgrade(
            id: 'auto_tap_speed',
            name: 'Усиленный конвейер',
            maxLevel: 3,
            baseCost: 1000,
            description: 'Авто-тап каждые 2 сек',
            effectType: 3,
            effectValue: 1),
        Upgrade(
            id: 'crit_amplifier',
            name: 'Сокровищный мех',
            maxLevel: 3,
            baseCost: 2000,
            description: 'Крит x10 вместо x5',
            effectType: 4,
            effectValue: 1),
        Upgrade(
            id: 'mole_fist',
            name: 'Кувалда гнома',
            maxLevel: 5,
            baseCost: 5000,
            description: '+2 к силе тапа',
            effectType: 5,
            effectValue: 2),
      ];

  Future<void> _init() async {
    await _loadGame();
    _expireExpiredBoostsIfNeeded();
    _startIncomeTimer();
    _startAutoTapTimer();
    _startSaveTimer();
  }

  Future<void> _loadGame() async {
    try {
      final savedWorkers = await _storage.loadWorkers();
      final savedUpgrades = await _storage.loadUpgrades();
      final savedState = await _storage.loadGameState();

      if (savedState != null) {
        final workersForCalc =
            savedWorkers.isNotEmpty ? savedWorkers : _defaultWorkers();
        final offlineGold = _calculateOfflineGold(savedState, workersForCalc);
        final mergedUpgrades = _mergeUpgrades(savedUpgrades);
        state = GameData(
          gameState: savedState.copyWith(
            gold: savedState.gold + offlineGold,
            totalGoldEarned: savedState.totalGoldEarned + offlineGold,
            lastSavedTime: null,
          ),
          workers: workersForCalc,
          upgrades: mergedUpgrades,
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error loading game: $e');
      }
    }
  }

  List<Upgrade> _mergeUpgrades(List<Upgrade> savedUpgrades) {
    final savedMap = {for (var u in savedUpgrades) u.id: u};

    final merged = <Upgrade>[];
    for (final def in _defaultUpgrades()) {
      if (savedMap.containsKey(def.id)) {
        merged.add(savedMap[def.id]!.copyWith(
          maxLevel: def.maxLevel,
          baseCost: def.baseCost,
          description: def.description,
        ));
      } else {
        merged.add(def);
      }
    }
    return merged;
  }

  int _calculateOfflineGold(GameState savedState, List<Worker> workers) {
    if (savedState.lastSavedTime == null) return 0;

    final now = DateTime.now();
    final elapsedSeconds =
        now.millisecondsSinceEpoch - savedState.lastSavedTime!;
    const maxOfflineSeconds = GameConfig.maxOfflineSeconds;
    final effectiveSeconds = min(elapsedSeconds ~/ 1000, maxOfflineSeconds);

    double gps = 0;
    for (final worker in workers) {
      gps += worker.baseIncome * worker.count;
    }
    double multiplier =
        savedState.depthMultiplier.toDouble() * savedState.prestigeMultiplier;
    final multiplierEnd = savedState.multiplierEndTime;
    if (multiplierEnd != null && now.millisecondsSinceEpoch < multiplierEnd) {
      multiplier *= 2;
    }
    return (gps * multiplier * effectiveSeconds).round();
  }

  void _startIncomeTimer() {
    _incomeTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      final gps = state.goldPerSecond;
      if (gps > 0) {
        _fractionalGold += gps;
        final toAdd = _fractionalGold.floor();
        if (toAdd > 0) {
          _fractionalGold -= toAdd;
          state = state.copyWith(
            gameState: state.gameState.copyWith(
              gold: state.gameState.gold + toAdd,
              totalGoldEarned: state.gameState.totalGoldEarned + toAdd,
            ),
          );
        }
      }
    });
  }

  void _startAutoTapTimer() {
    _autoTapTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      final hasBuff = state.gameState.autoTapMinutesRemaining != null &&
          state.gameState.autoTapMinutesRemaining! > 0;
      if (hasBuff) {
        _decreaseAutoTapBuffer();
      }
      final autoTapUpgrade = state.upgrades.firstWhere(
        (u) => u.id == 'auto_tap',
        orElse: () => Upgrade(id: '', name: '', maxLevel: 0, baseCost: 0),
      );
      if (autoTapUpgrade.level > 0 || hasBuff) {
        _performTap(silent: true);
      }
    });
  }

  void _decreaseAutoTapBuffer() {
    final remaining = state.gameState.autoTapMinutesRemaining;
    if (remaining == null || remaining <= 0) return;
    state = state.copyWith(
      gameState: state.gameState.copyWith(
        autoTapMinutesRemaining: remaining - 1,
      ),
    );
  }

  void _startSaveTimer() {
    _saveTimer = Timer.periodic(const Duration(seconds: 10), (_) async {
      if (_isSaving) return;
      _isSaving = true;
      try {
        await _saveAll();
      } catch (e) {
        if (kDebugMode) {
          print('Error saving game: $e');
        }
      } finally {
        _isSaving = false;
      }
    });
  }

  Future<void> _saveAll() async {
    final stateToSave = state.gameState.copyWith(
      lastSavedTime: DateTime.now().millisecondsSinceEpoch,
    );
    await _storage.saveGameState(stateToSave);
    await _storage.saveWorkers(state.workers);
    await _storage.saveUpgrades(state.upgrades);
  }

  void _performTap({bool silent = false}) {
    double multiplier = state.gameState.depthMultiplier.toDouble() *
        state.gameState.prestigeMultiplier;
    final now = DateTime.now().millisecondsSinceEpoch;
    if (state.gameState.multiplierEndTime != null &&
        now < state.gameState.multiplierEndTime!) {
      multiplier *= 2;
    }
    int tapValue = (state.gameState.tapPower * multiplier).round();
    if (!silent) {
      int totalCritChance = state.gameState.critChance;
      for (final upgrade in state.upgrades) {
        if (upgrade.id == 'luck') {
          totalCritChance = (totalCritChance + upgrade.level * 5).clamp(0, 100);
        }
      }
      if (Random().nextDouble() < totalCritChance / 100) {
        tapValue *= state.gameState.critMultiplier;
      }
    }

    state = state.copyWith(
      gameState: state.gameState.copyWith(
        gold: state.gameState.gold + tapValue,
        totalGoldEarned: state.gameState.totalGoldEarned + tapValue,
      ),
    );
  }

  void tap() {
    _performTap(silent: false);
  }

  void spendGold(int amount) {
    if (amount > state.gameState.gold) return;
    state = state.copyWith(
      gameState: state.gameState.copyWith(gold: state.gameState.gold - amount),
    );
  }

  int _getWorkerCostWithDiscount(Worker worker) {
    int discountPercent = state.gameState.workerCostDiscount;
    return (worker.currentCost * (100 - discountPercent) / 100).round();
  }

  Future<void> buyWorker(String workerId) async {
    final workerIndex = state.workers.indexWhere((w) => w.id == workerId);

    if (workerIndex == -1) return;
    final worker = state.workers[workerIndex];
    final discountedCost = _getWorkerCostWithDiscount(worker);
    if (state.gameState.gold < discountedCost) return;
    if (worker.depthRequired > state.gameState.depth) return;

    spendGold(discountedCost);

    final newWorkers = [
      ...state.workers.sublist(0, workerIndex),
      worker.copyWith(count: worker.count + 1),
      ...state.workers.sublist(workerIndex + 1),
    ];

    state = state.copyWith(workers: newWorkers);
    await _saveAll();
  }

  Future<void> buyUpgrade(String upgradeId) async {
    final upgradeIndex = state.upgrades.indexWhere((u) => u.id == upgradeId);
    if (upgradeIndex == -1) return;

    final upgrade = state.upgrades[upgradeIndex];
    if (upgrade.level >= upgrade.maxLevel) return;
    if (state.gameState.gold < upgrade.currentCost) return;

    spendGold(upgrade.currentCost);

    final newUpgrades = [
      ...state.upgrades.sublist(0, upgradeIndex),
      upgrade.copyWith(level: upgrade.level + 1),
      ...state.upgrades.sublist(upgradeIndex + 1),
    ];

    GameState? newGameState;
    if (upgradeId == 'pickaxe') {
      newGameState =
          state.gameState.copyWith(tapPower: state.gameState.tapPower + 1);
    } else if (upgradeId == 'luck') {
      newGameState = state.gameState
          .copyWith(critChance: (state.gameState.critChance + 5).clamp(0, 100));
    } else if (upgradeId == 'ore_shield') {
    } else if (upgradeId == 'quality_steel') {
      newGameState = state.gameState
          .copyWith(workerCostDiscount: state.gameState.workerCostDiscount + 5);
    } else if (upgradeId == 'auto_tap_speed') {
      newGameState = state.gameState.copyWith(autoTapTicks: 2);
    } else if (upgradeId == 'crit_amplifier') {
      newGameState = state.gameState.copyWith(critMultiplier: 10);
    } else if (upgradeId == 'mole_fist') {
      newGameState =
          state.gameState.copyWith(tapPower: state.gameState.tapPower + 2);
    }

    if (newGameState != null) {
      state = state.copyWith(
        upgrades: newUpgrades,
        gameState: newGameState,
      );
    } else {
      state = state.copyWith(upgrades: newUpgrades);
    }

    await _saveAll();
  }

  Future<void> nextDepth() async {
    if (state.gameState.depth >= 5) return;

    final cost = depthCosts[state.gameState.depth - 1];

    if (state.gameState.gold >= cost) {
      state = state.copyWith(
        gameState: state.gameState.copyWith(
          gold: state.gameState.gold - cost,
          depth: state.gameState.depth + 1,
          depthMultiplier: state.gameState.depthMultiplier * 2,
        ),
      );
      await _storage.saveGameState(state.gameState);
    }
  }

  Future<void> prestige() async {
    if (state.gameState.totalGoldEarned >= 500000) {
      final newPrestigePoints = (state.gameState.prestigePoints ?? 0) + 1;
      final newPrestigeMultiplier = (state.gameState.prestigeMultiplier * 2);
      state = state.copyWith(
        gameState: GameState(
          gold: 0,
          totalGoldEarned: 0,
          depth: 1,
          depthMultiplier: 1,
          prestigeMultiplier: newPrestigeMultiplier,
          tapPower: 1,
          critChance: 10,
          prestigePoints: newPrestigePoints,
        ),
        workers: _defaultWorkers(),
        upgrades: _defaultUpgrades(),
      );
      await _saveAll();
    }
  }

  Future<void> claimDailyBonus() async {
    final now = DateTime.now().millisecondsSinceEpoch;
    final last = state.gameState.lastBonusClaimTime;
    int streak = state.gameState.consecutiveDays;
    if (last == null) {
      streak = 1;
    } else if (now - last >= const Duration(days: 1).inMilliseconds &&
        now - last < const Duration(days: 2).inMilliseconds) {
      streak = (streak + 1).clamp(1, 7);
    } else {
      streak = 1;
    }
    int reward = switch (streak) {
      1 => 50,
      2 => 100,
      3 => 200,
      4 => 500,
      5 => 0,
      6 => 0,
      7 => 0,
      _ => 50,
    };
    int? autoTapMinutes = state.gameState.autoTapMinutesRemaining;
    int? multiplierEnd = state.gameState.multiplierEndTime;
    if (streak == 5) {
      autoTapMinutes = (autoTapMinutes ?? 0) + 30;
    } else if (streak == 6) {
      multiplierEnd = now + const Duration(hours: 1).inMilliseconds;
    } else if (streak == 7) {
      multiplierEnd = null;
    }
    state = state.copyWith(
      gameState: state.gameState.copyWith(
        gold: state.gameState.gold + reward,
        totalGoldEarned: state.gameState.totalGoldEarned + reward,
        lastBonusClaimTime: now,
        consecutiveDays: streak,
        autoTapMinutesRemaining: autoTapMinutes,
        multiplierEndTime: multiplierEnd,
        prestigePoints: streak == 7
            ? (state.gameState.prestigePoints ?? 0) + 1
            : state.gameState.prestigePoints,
      ),
    );
    _expireExpiredBoostsIfNeeded();
    await _saveAll();
  }

  void _expireExpiredBoostsIfNeeded() {
    final end = state.gameState.multiplierEndTime;
    if (end == null) return;
    final now = DateTime.now().millisecondsSinceEpoch;
    if (now >= end) {
      state = state.copyWith(
        gameState: state.gameState.copyWith(multiplierEndTime: null),
      );
    }
  }

  bool get canClaimDailyBonus {
    final now = DateTime.now().millisecondsSinceEpoch;
    final last = state.gameState.lastBonusClaimTime;
    if (last == null) return true;
    return now - last >= const Duration(days: 1).inMilliseconds;
  }

  void applySettingUpdate(GameState updated) {
    state = state.copyWith(gameState: updated);
    _saveAll();
  }

  Future<void> manualSave() async {
    try {
      await _saveAll();
    } catch (e) {
      if (kDebugMode) {
        print('Error during manual save: $e');
      }
    }
  }

  Future<void> resetGame() async {
    state = GameData(
      gameState: GameState(),
      workers: _defaultWorkers(),
      upgrades: _defaultUpgrades(),
    );
    await _saveAll();
  }

  @override
  void dispose() {
    _incomeTimer?.cancel();
    _autoTapTimer?.cancel();
    _saveTimer?.cancel();
    super.dispose();
  }
}

final gameProvider = StateNotifierProvider<GameNotifier, GameData>((ref) {
  return GameNotifier();
});

final gameStateProvider = Provider<GameState>((ref) {
  return ref.watch(gameProvider).gameState;
});

final workersProvider = Provider<List<Worker>>((ref) {
  return ref.watch(gameProvider).workers;
});

final upgradesProvider = Provider<List<Upgrade>>((ref) {
  return ref.watch(gameProvider).upgrades;
});

final goldPerSecondProvider = Provider<double>((ref) {
  return ref.watch(gameProvider).goldPerSecond;
});

final canPrestigeProvider = Provider<bool>((ref) {
  return ref.watch(gameProvider).gameState.totalGoldEarned >= 500000;
});

final canClaimDailyBonusProvider = Provider<bool>((ref) {
  final gameState = ref.watch(gameStateProvider);
  if (gameState.lastBonusClaimTime == null) return true;
  final now = DateTime.now().millisecondsSinceEpoch;
  return now - gameState.lastBonusClaimTime! >=
      const Duration(days: 1).inMilliseconds;
});

final dailyStreakProvider = Provider<int>((ref) {
  return ref.watch(gameStateProvider).consecutiveDays;
});

final hasActiveMultiplierBoostProvider = Provider<bool>((ref) {
  final gameState = ref.watch(gameStateProvider);
  if (gameState.multiplierEndTime == null) return false;
  final now = DateTime.now().millisecondsSinceEpoch;
  return now < gameState.multiplierEndTime!;
});

final prestigePointsProvider = Provider<int>((ref) {
  return ref.watch(gameProvider).gameState.prestigePoints ?? 0;
});

final totalGoldEarnedProvider = Provider<int>((ref) {
  return ref.watch(gameProvider).gameState.totalGoldEarned;
});
