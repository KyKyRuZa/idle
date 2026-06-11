// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upgrade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpgradeImpl _$$UpgradeImplFromJson(Map<String, dynamic> json) =>
    _$UpgradeImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      maxLevel: (json['maxLevel'] as num).toInt(),
      level: (json['level'] as num?)?.toInt() ?? 0,
      baseCost: (json['baseCost'] as num).toInt(),
      description: json['description'] as String? ?? '',
      effectType: (json['effectType'] as num?)?.toInt() ?? 0,
      effectValue: (json['effectValue'] as num?)?.toInt() ?? 0,
      isPermanent: json['isPermanent'] as bool? ?? false,
    );

Map<String, dynamic> _$$UpgradeImplToJson(_$UpgradeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'maxLevel': instance.maxLevel,
      'level': instance.level,
      'baseCost': instance.baseCost,
      'description': instance.description,
      'effectType': instance.effectType,
      'effectValue': instance.effectValue,
      'isPermanent': instance.isPermanent,
    };
