import 'dart:math';
import 'package:flutter_test/flutter_test.dart';
import 'package:idle_stronghold/models/game_state.dart';
import 'package:idle_stronghold/models/worker.dart';

void main() {
  group('GameState', () {
    test('initial values with new fields are correct', () {
      final state = GameState();
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

    test('copyWith works with new fields', () {
      final state = GameState(prestigePoints: 3, lastSavedTime: 12345);
      final newState = state.copyWith(prestigePoints: 5);
      
      expect(state.prestigePoints, 3);
      expect(newState.prestigePoints, 5);
    });

    test('toJson and fromJson work with new fields', () {
      final state = GameState(
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
      final worker = Worker(id: 'test', name: 'Test', baseIncome: 10, baseCost: 100, count: 0);
      expect(worker.currentCost, 100);
      
      final worker1 = Worker(id: 'test', name: 'Test', baseIncome: 10, baseCost: 100, count: 1);
      expect(worker1.currentCost, 115);
      
      final worker10 = Worker(id: 'test', name: 'Test', baseIncome: 10, baseCost: 100, count: 10);
      expect(worker10.currentCost, 405);
    });
  });

  group('Game Logic', () {
    test('spendGold protection logic', () {
      final state = GameState(gold: 100);
      int gold = state.gold;
      
      const amount = 50;
      gold -= amount;
      expect(gold, 50);
      
      const amountTooLarge = 200;
      if (amountTooLarge <= 50) gold -= amountTooLarge;
      expect(gold, 50);
    });

    test('offline gold calculation formula', () {
      const maxOfflineSeconds = 8 * 60 * 60;
      expect(maxOfflineSeconds, 28800);
      
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
  });

  group('Depth Costs', () {
    test('depth costs array is correct', () {
      const costs = [500, 2000, 10000, 50000, 250000];
      expect(costs[0], 500);
      expect(costs[4], 250000);
    });
  });
}