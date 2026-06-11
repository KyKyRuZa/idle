import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_state.freezed.dart';
part 'game_state.g.dart';

@freezed
class GameState with _$GameState {
  const factory GameState({
    @Default(0) int gold,
    @Default(0) int totalGoldEarned,
    @Default(1) int depth,
    @Default(1) int depthMultiplier,
    @Default(1) int prestigeMultiplier,
    @Default(1) int tapPower,
    @Default(10) int critChance,
    int? prestigePoints,
    int? lastSavedTime,
    int? lastBonusClaimTime,
    @Default(0) int consecutiveDays,
    int? autoTapMinutesRemaining,
    int? multiplierEndTime,
    @Default(true) bool musicEnabled,
    @Default(true) bool soundsEnabled,
    @Default(true) bool effectsEnabled,
    @Default(true) bool vibrationEnabled,
    @Default(0) int workerCostDiscount,
    @Default(1) int autoTapTicks,
    @Default(5) int critMultiplier,
  }) = _GameState;

  const GameState._();

  factory GameState.fromJson(Map<String, dynamic> json) => _$GameStateFromJson(json);
}