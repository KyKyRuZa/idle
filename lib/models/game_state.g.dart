// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameStateImpl _$$GameStateImplFromJson(Map<String, dynamic> json) =>
    _$GameStateImpl(
      gold: (json['gold'] as num?)?.toInt() ?? 0,
      totalGoldEarned: (json['totalGoldEarned'] as num?)?.toInt() ?? 0,
      depth: (json['depth'] as num?)?.toInt() ?? 1,
      depthMultiplier: (json['depthMultiplier'] as num?)?.toInt() ?? 1,
      prestigeMultiplier: (json['prestigeMultiplier'] as num?)?.toInt() ?? 1,
      tapPower: (json['tapPower'] as num?)?.toInt() ?? 1,
      critChance: (json['critChance'] as num?)?.toInt() ?? 10,
      prestigePoints: (json['prestigePoints'] as num?)?.toInt(),
      lastSavedTime: (json['lastSavedTime'] as num?)?.toInt(),
      lastBonusClaimTime: (json['lastBonusClaimTime'] as num?)?.toInt(),
      consecutiveDays: (json['consecutiveDays'] as num?)?.toInt() ?? 0,
      autoTapMinutesRemaining:
          (json['autoTapMinutesRemaining'] as num?)?.toInt(),
      multiplierEndTime: (json['multiplierEndTime'] as num?)?.toInt(),
      musicEnabled: json['musicEnabled'] as bool? ?? true,
      soundsEnabled: json['soundsEnabled'] as bool? ?? true,
      effectsEnabled: json['effectsEnabled'] as bool? ?? true,
      vibrationEnabled: json['vibrationEnabled'] as bool? ?? true,
      workerCostDiscount: (json['workerCostDiscount'] as num?)?.toInt() ?? 0,
      autoTapTicks: (json['autoTapTicks'] as num?)?.toInt() ?? 1,
      critMultiplier: (json['critMultiplier'] as num?)?.toInt() ?? 5,
    );

Map<String, dynamic> _$$GameStateImplToJson(_$GameStateImpl instance) =>
    <String, dynamic>{
      'gold': instance.gold,
      'totalGoldEarned': instance.totalGoldEarned,
      'depth': instance.depth,
      'depthMultiplier': instance.depthMultiplier,
      'prestigeMultiplier': instance.prestigeMultiplier,
      'tapPower': instance.tapPower,
      'critChance': instance.critChance,
      'prestigePoints': instance.prestigePoints,
      'lastSavedTime': instance.lastSavedTime,
      'lastBonusClaimTime': instance.lastBonusClaimTime,
      'consecutiveDays': instance.consecutiveDays,
      'autoTapMinutesRemaining': instance.autoTapMinutesRemaining,
      'multiplierEndTime': instance.multiplierEndTime,
      'musicEnabled': instance.musicEnabled,
      'soundsEnabled': instance.soundsEnabled,
      'effectsEnabled': instance.effectsEnabled,
      'vibrationEnabled': instance.vibrationEnabled,
      'workerCostDiscount': instance.workerCostDiscount,
      'autoTapTicks': instance.autoTapTicks,
      'critMultiplier': instance.critMultiplier,
    };
