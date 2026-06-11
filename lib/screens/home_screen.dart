import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/game_provider.dart';
import '../widgets/tap_button.dart';
import '../theme/app_theme.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameStateProvider);
    final goldPerSecond = ref.watch(goldPerSecondProvider);
    final canPrestige = ref.watch(canPrestigeProvider);
    final hasMultiplierBoost = ref.watch(hasActiveMultiplierBoostProvider);

    final depthColors = AppColors.depthBackgrounds;

    return Scaffold(
      backgroundColor: depthColors[gameState.depth - 1],
      appBar: AppBar(
        title: null,
        backgroundColor: Colors.black87,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Consumer(
              builder: (context, ref, _) {
                final canClaim = ref.watch(canClaimDailyBonusProvider);
                final streak = ref.watch(dailyStreakProvider);
                return GestureDetector(
                  onTap: canClaim
                      ? () async {
                          await ref.read(gameProvider.notifier).claimDailyBonus();
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Ежедневный бонус получен! День $streak',
                                  style: AppTheme.cinzelStyle(),
                                ),
                                backgroundColor: Colors.green,
                              ),
                            );
                          }
                        }
                      : null,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: canClaim ? Colors.amber : Colors.grey.shade700,
                      border: Border.all(
                        color: canClaim ? Colors.amberAccent : Colors.grey,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: canClaim
                          ? Text(
                              '$streak',
                              style: AppTheme.cinzelStyle(
                                color: Colors.brown.shade900,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            )
                          : const Icon(
                              Icons.calendar_today,
                              color: Colors.grey,
                              size: 24,
                            ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Слой: ${gameState.depth}/5',
                        style: AppTheme.cinzelStyle(
                          fontSize: 18,
                          color: AppColors.textOnDark,
                        ),
                      ),
                      Text(
                        'Престиж: x${gameState.prestigeMultiplier}',
                        style: AppTheme.cinzelStyle(
                          fontSize: 18,
                          color: AppColors.textOnDark,
                        ),
                      ),
                    ],
                  ),
                  if (gameState.prestigePoints != null && gameState.prestigePoints! > 0)
                    Text(
                      'Очки престижа: ${gameState.prestigePoints}',
                      style: AppTheme.cinzelStyle(
                        fontSize: 16,
                        color: AppColors.textSecondary,
                      ),
                    ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.amber.withValues(alpha: 0.5), width: 2),
              ),
              child: Column(
                children: [
                  Text(
                    '${gameState.gold} 💰',
                    style: AppTheme.cinzelStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  Text(
                    '${goldPerSecond.round()} золота/сек${hasMultiplierBoost ? ' (×2 активно!)' : ''}',
                    style: AppTheme.cinzelStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const TapButton(),
            const SizedBox(height: 40),
            const Spacer(),
            if (canPrestige)
              Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: () => ref.read(gameProvider.notifier).prestige(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.prestigeButton,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Возрождение шахты',
                    style: AppTheme.cinzelStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            if (gameState.depth < 5)
              Padding(
                padding: const EdgeInsets.all(16),
                child: _buildDepthUpgradeButton(ref),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDepthUpgradeButton(WidgetRef ref) {
    final gameState = ref.watch(gameStateProvider);
    final cost = GameNotifier.depthCosts[gameState.depth - 1];

    return ElevatedButton(
      onPressed: gameState.gold >= cost
          ? () => ref.read(gameProvider.notifier).nextDepth()
          : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.brown.shade700,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        'Следующий слой: $cost 💰',
        style: AppTheme.cinzelStyle(color: Colors.amber),
      ),
    );
  }
}