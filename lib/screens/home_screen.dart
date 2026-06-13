import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/game_provider.dart';
import '../widgets/tap_button.dart';
import '../theme/app_theme.dart';
import 'settings_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameStateProvider);
    final goldPerSecond = ref.watch(goldPerSecondProvider);
    final canPrestige = ref.watch(canPrestigeProvider);

    final depthColors = AppColors.depthBackgrounds;

    return Scaffold(
      backgroundColor: depthColors[gameState.depth - 1],
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 0,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
                color: Colors.amber.withValues(alpha: 0.5), width: 1),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.monetization_on,
                  color: AppColors.primary, size: 20),
              const SizedBox(width: 4),
              Text(
                gameState.gold.toString(),
                style: AppTheme.cinzelStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: 2),
              Text(
                '/ ${goldPerSecond.round()} в сек',
                style: AppTheme.cinzelStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon:
                const Icon(Icons.settings, color: AppColors.primary, size: 24),
            onPressed: () => _showSettingsModal(context),
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
                  if (gameState.prestigePoints != null &&
                      gameState.prestigePoints! > 0)
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
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

  void _showSettingsModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: const BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: const Material(
          color: Colors.transparent,
          child: Column(
            children: [
              SizedBox(height: 12),
              Expanded(child: SettingsScreen()),
            ],
          ),
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
