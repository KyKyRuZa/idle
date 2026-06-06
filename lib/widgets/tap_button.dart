import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/game_provider.dart';

class TapButton extends ConsumerStatefulWidget {
  const TapButton({super.key});

  @override
  ConsumerState<TapButton> createState() => _TapButtonState();
}

class _TapButtonState extends ConsumerState<TapButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    _controller.forward().then((_) => _controller.reverse());
    ref.read(gameProvider.notifier).tap();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: GestureDetector(
        onTap: _handleTap,
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            gradient: const RadialGradient(
              colors: [Color(0xFFFFD700), Color(0xFFDAA520), Color(0xFF8B4513)],
              center: Alignment.center,
              radius: 0.8,
            ),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.amber.withValues(alpha: 0.6),
                blurRadius: 25,
                spreadRadius: 3,
              ),
            ],
          ),
          child: const Center(
            child: Text(
              '⛏️',
              style: TextStyle(fontSize: 48),
            ),
          ),
        ),
      ),
    );
  }
}