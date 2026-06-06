import 'dart:math';

class Upgrade {
  final String id;
  final String name;
  final int maxLevel;
  int level;
  final int baseCost;

  Upgrade({
    required this.id,
    required this.name,
    required this.maxLevel,
    this.level = 0,
    required this.baseCost,
  });

  int get currentCost => (baseCost * pow(2, level)).round();

  Upgrade copyWith({int? level}) {
    return Upgrade(
      id: id,
      name: name,
      maxLevel: maxLevel,
      level: level ?? this.level,
      baseCost: baseCost,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'maxLevel': maxLevel,
        'level': level,
        'baseCost': baseCost,
      };

  factory Upgrade.fromJson(Map<String, dynamic> json) => Upgrade(
        id: json['id'],
        name: json['name'],
        maxLevel: json['maxLevel'],
        level: json['level'] ?? 0,
        baseCost: json['baseCost'],
      );
}