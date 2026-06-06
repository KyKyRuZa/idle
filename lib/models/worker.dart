import 'dart:math';

class Worker {
  final String id;
  final String name;
  final int baseIncome;
  final int baseCost;
  int count;
  int depthRequired;
  final String emoji;

  Worker({
    required this.id,
    required this.name,
    required this.baseIncome,
    required this.baseCost,
    this.count = 0,
    this.depthRequired = 1,
    this.emoji = '',
  });

  int get currentCost => (baseCost * pow(1.15, count)).round();

  Worker copyWith({int? count}) {
    return Worker(
      id: id,
      name: name,
      baseIncome: baseIncome,
      baseCost: baseCost,
      count: count ?? this.count,
      depthRequired: depthRequired,
      emoji: emoji,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'baseIncome': baseIncome,
        'baseCost': baseCost,
        'count': count,
        'depthRequired': depthRequired,
        'emoji': emoji,
      };

  factory Worker.fromJson(Map<String, dynamic> json) => Worker(
        id: json['id'],
        name: json['name'],
        baseIncome: json['baseIncome'],
        baseCost: json['baseCost'],
        count: json['count'] ?? 0,
        depthRequired: json['depthRequired'] ?? 1,
        emoji: json['emoji'] ?? '',
      );
}