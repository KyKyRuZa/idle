import 'dart:math';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'worker.freezed.dart';
part 'worker.g.dart';

@freezed
class Worker with _$Worker {
  const factory Worker({
    required String id,
    required String name,
    required int baseIncome,
    required int baseCost,
    @Default(0) int count,
    @Default(1) int depthRequired,
    @Default('') String emoji,
  }) = _Worker;

  const Worker._();

  int get currentCost => (baseCost * pow(1.15, count)).round();

  factory Worker.fromJson(Map<String, dynamic> json) => _$WorkerFromJson(json);
}