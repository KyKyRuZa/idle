import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/game_provider.dart';
import '../models/game_state.dart';
import '../theme/app_theme.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameStateProvider);

    return Scaffold(
      backgroundColor: AppColors.depthBackgrounds[0],
      appBar: AppBar(
        title: Text(
          'Настройки',
          style: GoogleFonts.cinzel(color: AppColors.primary),
        ),
        backgroundColor: Colors.black87,
        iconTheme: const IconThemeData(color: AppColors.primary),
      ),
      body: ListView(
        children: [
          _buildSectionHeader('ИГРА'),
          _buildSwitchTile(
            context: context,
            icon: Icons.music_note,
            title: 'Музыка',
            value: gameState.musicEnabled,
            onChanged: (value) => _updateSetting(ref, (s) => s.copyWith(musicEnabled: value)),
          ),
          _buildSwitchTile(
            context: context,
            icon: Icons.volume_up,
            title: 'Звуки',
            value: gameState.soundsEnabled,
            onChanged: (value) => _updateSetting(ref, (s) => s.copyWith(soundsEnabled: value)),
          ),
          _buildSwitchTile(
            context: context,
            icon: Icons.auto_awesome,
            title: 'Эффекты',
            value: gameState.effectsEnabled,
            onChanged: (value) => _updateSetting(ref, (s) => s.copyWith(effectsEnabled: value)),
          ),
          _buildSwitchTile(
            context: context,
            icon: Icons.vibration,
            title: 'Вибрация',
            value: gameState.vibrationEnabled,
            onChanged: (value) => _updateSetting(ref, (s) => s.copyWith(vibrationEnabled: value)),
          ),
          const SizedBox(height: 24),
          _buildSectionHeader('АККАУНТ'),
          ListTile(
            leading: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF8B4513), Color(0xFF5D4037)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.login, color: AppColors.primary),
            ),
            title: Text(
              'Google Play Games',
              style: GoogleFonts.cinzel(color: AppColors.textOnDark, fontSize: 16),
            ),
            subtitle: Text(
              'Синхронизация достижений',
              style: GoogleFonts.cinzel(color: AppColors.textSecondary, fontSize: 12),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Подключение будет в обновлении')),
              );
            },
          ),
          const SizedBox(height: 24),
          _buildSectionHeader('ИНФОРМАЦИЯ'),
          ListTile(
            leading: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF8B4513), Color(0xFF5D4037)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.info_outline, color: AppColors.primary),
            ),
            title: Text(
              'Версия',
              style: GoogleFonts.cinzel(color: AppColors.textOnDark, fontSize: 16),
            ),
            subtitle: Text(
              '1.0.0',
              style: GoogleFonts.cinzel(color: AppColors.textSecondary, fontSize: 12),
            ),
          ),
          const SizedBox(height: 24),
          _buildSectionHeader('ОПАСНОСТЬ'),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.red.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.red.withValues(alpha: 0.3), width: 1.5),
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF8B4513), Color(0xFF5D4037)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.delete_forever, color: Colors.red),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Сбросить прогресс',
                        style: GoogleFonts.cinzel(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        'Удалит весь прогресс навсегда',
                        style: GoogleFonts.cinzel(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _showResetDialog(context, ref),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Сброс',
                    style: GoogleFonts.cinzel(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: GoogleFonts.cinzel(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildSwitchTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      secondary: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF8B4513), Color(0xFF5D4037)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: AppColors.primary),
      ),
      title: Text(
        title,
        style: GoogleFonts.cinzel(color: AppColors.textOnDark, fontSize: 16),
      ),
      value: value,
      onChanged: onChanged,
      activeThumbColor: AppColors.primary,
      inactiveThumbColor: Colors.grey,
      inactiveTrackColor: Colors.grey.shade700,
    );
  }

  void _updateSetting(WidgetRef ref, GameState Function(GameState) updater) {
    final current = ref.read(gameStateProvider);
    ref.read(gameProvider.notifier).applySettingUpdate(updater(current));
  }

  void _showResetDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.cardBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          'Сбросить прогресс?',
          style: GoogleFonts.cinzel(color: Colors.red, fontSize: 20),
        ),
        content: Text(
          'Это действие нельзя отменить. Весь прогресс, включая золото, работников и улучшения, будет утерян.',
          style: GoogleFonts.cinzel(color: AppColors.textSecondary, fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Отмена',
              style: GoogleFonts.cinzel(color: AppColors.textSecondary),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context);
              await ref.read(gameProvider.notifier).resetGame();
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Прогресс сброшен')),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
            child: Text(
              'Сбросить',
              style: GoogleFonts.cinzel(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
