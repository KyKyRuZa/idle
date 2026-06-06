import 'package:flutter_test/flutter_test.dart';
import 'package:idle_stronghold/models/worker.dart';

void main() {
  group('Worker', () {
    test('initial count is zero', () {
      final worker = Worker(
        id: 'test',
        name: 'Test Worker',
        baseIncome: 10,
        baseCost: 100,
      );
      expect(worker.count, 0);
      expect(worker.currentCost, 100);
    });

    test('currentCost increases with count', () {
      final worker = Worker(
        id: 'test',
        name: 'Test Worker',
        baseIncome: 10,
        baseCost: 100,
        count: 1,
      );
      expect(worker.currentCost, greaterThan(100));
    });

    test('copyWith updates count', () {
      final worker = Worker(
        id: 'test',
        name: 'Test Worker',
        baseIncome: 10,
        baseCost: 100,
        count: 2,
      );
      final newWorker = worker.copyWith(count: 3);
      expect(worker.count, 2);
      expect(newWorker.count, 3);
    });

    test('toJson and fromJson work correctly', () {
      final worker = Worker(
        id: 'dwarf',
        name: 'Гном',
        baseIncome: 1,
        baseCost: 10,
        count: 5,
        depthRequired: 1,
        emoji: '🧌',
      );
      
      final json = worker.toJson();
      final restored = Worker.fromJson(json);
      
      expect(restored.id, 'dwarf');
      expect(restored.name, 'Гном');
      expect(restored.baseIncome, 1);
      expect(restored.baseCost, 10);
      expect(restored.count, 5);
      expect(restored.depthRequired, 1);
      expect(restored.emoji, '🧌');
    });
  });
}