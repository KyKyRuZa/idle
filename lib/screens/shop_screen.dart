import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/game_provider.dart';
import '../models/worker.dart';
import '../models/game_state.dart';
import '../theme/app_theme.dart';

class ShopScreen extends ConsumerWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workers = ref.watch(workersProvider);
    final gameState = ref.watch(gameStateProvider);

    return Scaffold(
      backgroundColor: AppColors.depthBackgrounds[0],
      appBar: AppBar(
        title: Text(
          'Наем существ',
          style: GoogleFonts.cinzel(color: AppColors.primary),
        ),
        backgroundColor: Colors.black87,
        iconTheme: const IconThemeData(color: AppColors.primary),
      ),
      body: ListView.builder(
        itemCount: workers.length,
        itemBuilder: (context, index) {
          final worker = workers[index];
          if (worker.depthRequired > gameState.depth) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(Icons.lock, color: Colors.black54),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          worker.name,
                          style: GoogleFonts.cinzel(
                            fontSize: 18,
                            color: Colors.grey.shade400,
                          ),
                        ),
                        Text(
                          'Откроется на слое ${worker.depthRequired}',
                          style: GoogleFonts.cinzel(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return _buildWorkerTile(ref, worker, gameState);
        },
      ),
    );
  }

  Widget _buildWorkerTile(WidgetRef ref, Worker worker, GameState gameState) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.amber.withValues(alpha: 0.4), width: 1.5),
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
              child: Text(
                worker.emoji,
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  worker.name,
                  style: GoogleFonts.cinzel(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textOnDark,
                  ),
                ),
                Text(
                  '${worker.baseIncome} золота/сек',
                  style: GoogleFonts.cinzel(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
                Text(
                  'В наличии: ${worker.count}',
                  style: GoogleFonts.cinzel(
                    fontSize: 12,
                    color: Colors.grey.shade400,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                '${worker.currentCost} 💰',
                style: GoogleFonts.cinzel(
                  fontSize: 14,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 4),
              ElevatedButton(
                onPressed: gameState.gold >= worker.currentCost
                    ? () => ref.read(gameProvider.notifier).buyWorker(worker.id)
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Купить',
                  style: GoogleFonts.cinzel(
                    color: Colors.brown.shade900,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}