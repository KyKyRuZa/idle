import 'package:flutter_test/flutter_test.dart';
import 'package:idle_stronghold/models/upgrade.dart';

void main() {
  group('Upgrade', () {
    test('initial level is zero', () {
      final upgrade = Upgrade(
        id: 'pickaxe',
        name: 'Магическая кирка',
        maxLevel: 5,
        baseCost: 50,
      );
      expect(upgrade.level, 0);
      expect(upgrade.currentCost, 50);
    });

    test('currentCost doubles with each level', () {
      final upgrade = Upgrade(
        id: 'pickaxe',
        name: 'Магическая кирка',
        maxLevel: 5,
        baseCost: 50,
        level: 1,
      );
      expect(upgrade.currentCost, 100);
      
      final upgrade2 = upgrade.copyWith(level: 2);
      expect(upgrade2.currentCost, 200);
    });

    test('copyWith updates level', () {
      final upgrade = Upgrade(
        id: 'luck',
        name: 'Шахтёрская удача',
        maxLevel: 8,
        baseCost: 50,
        level: 3,
      );
      final newUpgrade = upgrade.copyWith(level: 4);
      expect(upgrade.level, 3);
      expect(newUpgrade.level, 4);
    });

    test('toJson and fromJson work correctly', () {
      final upgrade = Upgrade(
        id: 'auto_tap',
        name: 'Авто-тап',
        maxLevel: 1,
        baseCost: 500,
        level: 1,
      );
      
      final json = upgrade.toJson();
      final restored = Upgrade.fromJson(json);
      
      expect(restored.id, 'auto_tap');
      expect(restored.name, 'Авто-тап');
      expect(restored.maxLevel, 1);
      expect(restored.baseCost, 500);
      expect(restored.level, 1);
    });
  });
}