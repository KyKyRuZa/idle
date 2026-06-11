import 'dart:math';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'upgrade.freezed.dart';
part 'upgrade.g.dart';

@freezed
class Upgrade with _$Upgrade {
  const factory Upgrade({
    required String id,
    required String name,
    required int maxLevel,
    @Default(0) int level,
    required int baseCost,
    @Default('') String description,
    @Default(0) int effectType,
    @Default(0) int effectValue,
    @Default(false) bool isPermanent,
  }) = _Upgrade;

  const Upgrade._();

  int get currentCost => (baseCost * pow(2, level)).round();

  factory Upgrade.fromJson(Map<String, dynamic> json) => _$UpgradeFromJson(json);
}