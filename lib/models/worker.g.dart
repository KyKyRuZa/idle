// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkerImpl _$$WorkerImplFromJson(Map<String, dynamic> json) => _$WorkerImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      baseIncome: (json['baseIncome'] as num).toInt(),
      baseCost: (json['baseCost'] as num).toInt(),
      count: (json['count'] as num?)?.toInt() ?? 0,
      depthRequired: (json['depthRequired'] as num?)?.toInt() ?? 1,
      emoji: json['emoji'] as String? ?? '',
    );

Map<String, dynamic> _$$WorkerImplToJson(_$WorkerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'baseIncome': instance.baseIncome,
      'baseCost': instance.baseCost,
      'count': instance.count,
      'depthRequired': instance.depthRequired,
      'emoji': instance.emoji,
    };
