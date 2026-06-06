import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
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

    final depthColors = AppColors.depthBackgrounds;

    return Scaffold(
      backgroundColor: depthColors[gameState.depth - 1],
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
                        style: GoogleFonts.cinzel(
                          fontSize: 18,
                          color: AppColors.textOnDark,
                        ),
                      ),
                      Text(
                        'Престиж: x${gameState.prestigeMultiplier}',
                        style: GoogleFonts.cinzel(
                          fontSize: 18,
                          color: AppColors.textOnDark,
                        ),
                      ),
                    ],
                  ),
                  if (gameState.prestigePoints != null && gameState.prestigePoints! > 0)
                    Text(
                      'Очки престижа: ${gameState.prestigePoints}',
                      style: GoogleFonts.cinzel(
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
                    style: GoogleFonts.cinzel(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
Text(
                     '${goldPerSecond.round()} золота/сек',
                     style: GoogleFonts.cinzel(
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
                    style: GoogleFonts.cinzel(
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
        style: GoogleFonts.cinzel(color: Colors.amber),
      ),
    );
  }
}