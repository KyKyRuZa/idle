import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/game_provider.dart';
import '../models/upgrade.dart';
import '../models/game_state.dart';
import '../theme/app_theme.dart';

class UpgradesScreen extends ConsumerWidget {
  const UpgradesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final upgrades = ref.watch(upgradesProvider);
    final gameState = ref.watch(gameStateProvider);

    return Scaffold(
      backgroundColor: AppColors.depthBackgrounds[0],
      appBar: AppBar(
        title: Text(
          'Улучшения',
          style: AppTheme.cinzelStyle(color: AppColors.primary),
        ),
        backgroundColor: Colors.black87,
        iconTheme: const IconThemeData(color: AppColors.primary),
      ),
      body: ListView.builder(
        itemCount: upgrades.length,
        itemBuilder: (context, index) {
          final upgrade = upgrades[index];
          return _buildUpgradeTile(ref, upgrade, gameState);
        },
      ),
    );
  }

  Widget _buildUpgradeTile(WidgetRef ref, Upgrade upgrade, GameState gameState) {
    String description;
    if (upgrade.id == 'pickaxe') {
      description = '+1 к силе тапа (ур. ${upgrade.level}/${upgrade.maxLevel})';
    } else if (upgrade.id == 'luck') {
      final bonus = upgrade.level * 5;
      description = '+$bonus% к шансу крита (ур. ${upgrade.level}/8)';
    } else if (upgrade.id == 'ore_shield') {
      final bonus = upgrade.level * 20;
      description = '+$bonus% к доходу рабочих (ур. ${upgrade.level}/10)';
    } else if (upgrade.id == 'quality_steel') {
      final bonus = upgrade.level * 5;
      description = '-$bonus% к цене рабочих (ур. ${upgrade.level}/5)';
    } else if (upgrade.id == 'auto_tap_speed') {
      description = 'Авто-тап каждые 2 сек (ур. ${upgrade.level}/3)';
    } else if (upgrade.id == 'crit_amplifier') {
      description = 'Крит x10 вместо x5 (ур. ${upgrade.level}/3)';
    } else if (upgrade.id == 'mole_fist') {
      description = '+2 к силе тапа (ур. ${upgrade.level}/${upgrade.maxLevel})';
    } else {
      description = 'Авто-тап каждые 3 секунды';
    }

    Color iconColor = AppColors.primary;
    if (upgrade.level >= upgrade.maxLevel) {
      iconColor = Colors.greenAccent;
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: upgrade.level >= upgrade.maxLevel
              ? Colors.greenAccent.withValues(alpha: 0.5)
              : Colors.amber.withValues(alpha: 0.4),
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF8B4513), Color(0xFF5D4037)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                upgrade.id == 'pickaxe'
                    ? Icons.touch_app
                    : upgrade.id == 'luck'
                        ? Icons.casino
                        : upgrade.id == 'ore_shield'
                            ? Icons.shield
                            : upgrade.id == 'quality_steel'
                                ? Icons.build
                                : upgrade.id == 'auto_tap_speed'
                                    ? Icons.speed
                                    : upgrade.id == 'crit_amplifier'
                                        ? Icons.flash_on
                                        : upgrade.id == 'mole_fist'
                                            ? Icons.sports_mma
                                            : Icons.autorenew,
                color: iconColor,
                size: 24,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  upgrade.name,
                  style: AppTheme.cinzelStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textOnDark,
                  ),
                ),
                Text(
                  description,
                  style: AppTheme.cinzelStyle(
                    fontSize: 12,
                    color: upgrade.level >= upgrade.maxLevel
                        ? Colors.greenAccent.shade200
                        : AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: upgrade.level >= upgrade.maxLevel
                ? null
                : gameState.gold >= upgrade.currentCost
                    ? () => ref.read(gameProvider.notifier).buyUpgrade(upgrade.id)
                    : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: upgrade.level >= upgrade.maxLevel
                  ? Colors.green
                  : AppColors.secondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              upgrade.level >= upgrade.maxLevel
                  ? 'Макс.'
                  : '${upgrade.currentCost} 💰',
              style: AppTheme.cinzelStyle(
                color: upgrade.level >= upgrade.maxLevel
                    ? Colors.white
                    : Colors.brown.shade900,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}