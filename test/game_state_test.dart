import 'package:flutter_test/flutter_test.dart';
import 'package:idle_stronghold/models/game_state.dart';

void main() {
  group('GameState', () {
    test('initial values are correct', () {
      final state = GameState();
      expect(state.gold, 0);
      expect(state.totalGoldEarned, 0);
      expect(state.depth, 1);
      expect(state.depthMultiplier, 1);
      expect(state.prestigeMultiplier, 1);
      expect(state.tapPower, 1);
      expect(state.critChance, 10);
    });

    test('copyWith creates new instance with updated values', () {
      final state = GameState(gold: 100, depth: 2);
      final newState = state.copyWith(gold: 200, depth: 3);
      
      expect(state.gold, 100);
      expect(state.depth, 2);
      expect(newState.gold, 200);
      expect(newState.depth, 3);
    });

    test('toJson and fromJson work correctly', () {
      final state = GameState(
        gold: 500,
        totalGoldEarned: 10000,
        depth: 3,
        depthMultiplier: 4,
        prestigeMultiplier: 2,
        tapPower: 5,
        critChance: 25,
      );
      
      final json = state.toJson();
      final restored = GameState.fromJson(json);
      
      expect(restored.gold, 500);
      expect(restored.totalGoldEarned, 10000);
      expect(restored.depth, 3);
      expect(restored.depthMultiplier, 4);
      expect(restored.prestigeMultiplier, 2);
      expect(restored.tapPower, 5);
      expect(restored.critChance, 25);
    });
  });
}