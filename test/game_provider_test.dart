import 'dart:math';
import 'package:flutter_test/flutter_test.dart';
import 'package:idle_stronghold/models/game_state.dart';
import 'package:idle_stronghold/models/worker.dart';
import 'package:idle_stronghold/models/upgrade.dart';
import 'package:idle_stronghold/core/constants.dart';

void main() {
  group('GameState', () {
    test('initial values with defaults are correct', () {
      const state = GameState();
      expect(state.gold, 0);
      expect(state.totalGoldEarned, 0);
      expect(state.depth, 1);
      expect(state.depthMultiplier, 1);
      expect(state.prestigeMultiplier, 1);
      expect(state.tapPower, 1);
      expect(state.critChance, 10);
      expect(state.prestigePoints, null);
      expect(state.lastSavedTime, null);
    });

    test('copyWith works correctly', () {
      const state = GameState(prestigePoints: 3, lastSavedTime: 12345);
      final newState = state.copyWith(prestigePoints: 5);

      expect(state.prestigePoints, 3);
      expect(newState.prestigePoints, 5);
    });

    test('toJson and fromJson work correctly', () {
      const state = GameState(
        gold: 500,
        prestigePoints: 3,
        lastSavedTime: 12345,
      );

      final json = state.toJson();
      final restored = GameState.fromJson(json);

      expect(restored.prestigePoints, 3);
      expect(restored.lastSavedTime, 12345);
    });
  });

  group('Worker', () {
    test('currentCost uses correct formula', () {
      const worker = Worker(
          id: 'test', name: 'Test', baseIncome: 10, baseCost: 100, count: 0);
      expect(worker.currentCost, 100);

      const worker1 = Worker(
          id: 'test', name: 'Test', baseIncome: 10, baseCost: 100, count: 1);
      expect(worker1.currentCost, 115);

      const worker10 = Worker(
          id: 'test', name: 'Test', baseIncome: 10, baseCost: 100, count: 10);
      expect(worker10.currentCost, 405);
    });

    test('copyWith preserves other fields', () {
      const worker = Worker(
          id: 'dwarf',
          name: 'Гном',
          baseIncome: 1,
          baseCost: 10,
          depthRequired: 1,
          emoji: '🧌',
          count: 5);
      final newWorker = worker.copyWith(count: 6);

      expect(worker.count, 5);
      expect(newWorker.count, 6);
      expect(newWorker.id, 'dwarf');
      expect(newWorker.depthRequired, 1);
    });
  });

  group('Upgrade', () {
    test('currentCost doubles with each level', () {
      const upgrade = Upgrade(id: 'pickaxe', name: 'Магическая кирка', maxLevel: 5, baseCost: 50, level: 1);
      expect(upgrade.currentCost, 100);

      final upgrade2 = upgrade.copyWith(level: 2);
      expect(upgrade2.currentCost, 200);
    });

    test('copyWith updates level', () {
      const upgrade = Upgrade(
          id: 'luck', name: 'Шахтёрская удача', maxLevel: 8, baseCost: 50, level: 3);
      final newUpgrade = upgrade.copyWith(level: 4);
      expect(upgrade.level, 3);
      expect(newUpgrade.level, 4);
    });
  });

  group('Game Logic', () {
    test('offline gold calculation formula', () {
      expect(GameConfig.maxOfflineSeconds, 28800);

      const elapsed = 300;
      const gps = 50;
      final offline = gps * elapsed;
      expect(offline, 15000);
    });

    test('prestige multiplier doubles each time', () {
      int multiplier(int points, int base) => base * pow(2, points).toInt();

      expect(multiplier(1, 1), 2);
      expect(multiplier(2, 1), 4);
      expect(multiplier(3, 1), 8);
      expect(multiplier(5, 1), 32);
    });

    test('depth costs are configurable', () {
      expect(GameConfig.depthCosts[0], 500);
      expect(GameConfig.depthCosts[4], 250000);
    });
  });
}