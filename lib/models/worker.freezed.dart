// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'worker.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Worker _$WorkerFromJson(Map<String, dynamic> json) {
  return _Worker.fromJson(json);
}

/// @nodoc
mixin _$Worker {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get baseIncome => throw _privateConstructorUsedError;
  int get baseCost => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  int get depthRequired => throw _privateConstructorUsedError;
  String get emoji => throw _privateConstructorUsedError;

  /// Serializes this Worker to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Worker
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkerCopyWith<Worker> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkerCopyWith<$Res> {
  factory $WorkerCopyWith(Worker value, $Res Function(Worker) then) =
      _$WorkerCopyWithImpl<$Res, Worker>;
  @useResult
  $Res call(
      {String id,
      String name,
      int baseIncome,
      int baseCost,
      int count,
      int depthRequired,
      String emoji});
}

/// @nodoc
class _$WorkerCopyWithImpl<$Res, $Val extends Worker>
    implements $WorkerCopyWith<$Res> {
  _$WorkerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Worker
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? baseIncome = null,
    Object? baseCost = null,
    Object? count = null,
    Object? depthRequired = null,
    Object? emoji = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      baseIncome: null == baseIncome
          ? _value.baseIncome
          : baseIncome // ignore: cast_nullable_to_non_nullable
              as int,
      baseCost: null == baseCost
          ? _value.baseCost
          : baseCost // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      depthRequired: null == depthRequired
          ? _value.depthRequired
          : depthRequired // ignore: cast_nullable_to_non_nullable
              as int,
      emoji: null == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkerImplCopyWith<$Res> implements $WorkerCopyWith<$Res> {
  factory _$$WorkerImplCopyWith(
          _$WorkerImpl value, $Res Function(_$WorkerImpl) then) =
      __$$WorkerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      int baseIncome,
      int baseCost,
      int count,
      int depthRequired,
      String emoji});
}

/// @nodoc
class __$$WorkerImplCopyWithImpl<$Res>
    extends _$WorkerCopyWithImpl<$Res, _$WorkerImpl>
    implements _$$WorkerImplCopyWith<$Res> {
  __$$WorkerImplCopyWithImpl(
      _$WorkerImpl _value, $Res Function(_$WorkerImpl) _then)
      : super(_value, _then);

  /// Create a copy of Worker
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? baseIncome = null,
    Object? baseCost = null,
    Object? count = null,
    Object? depthRequired = null,
    Object? emoji = null,
  }) {
    return _then(_$WorkerImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      baseIncome: null == baseIncome
          ? _value.baseIncome
          : baseIncome // ignore: cast_nullable_to_non_nullable
              as int,
      baseCost: null == baseCost
          ? _value.baseCost
          : baseCost // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      depthRequired: null == depthRequired
          ? _value.depthRequired
          : depthRequired // ignore: cast_nullable_to_non_nullable
              as int,
      emoji: null == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkerImpl extends _Worker {
  const _$WorkerImpl(
      {required this.id,
      required this.name,
      required this.baseIncome,
      required this.baseCost,
      this.count = 0,
      this.depthRequired = 1,
      this.emoji = ''})
      : super._();

  factory _$WorkerImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkerImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int baseIncome;
  @override
  final int baseCost;
  @override
  @JsonKey()
  final int count;
  @override
  @JsonKey()
  final int depthRequired;
  @override
  @JsonKey()
  final String emoji;

  @override
  String toString() {
    return 'Worker(id: $id, name: $name, baseIncome: $baseIncome, baseCost: $baseCost, count: $count, depthRequired: $depthRequired, emoji: $emoji)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.baseIncome, baseIncome) ||
                other.baseIncome == baseIncome) &&
            (identical(other.baseCost, baseCost) ||
                other.baseCost == baseCost) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.depthRequired, depthRequired) ||
                other.depthRequired == depthRequired) &&
            (identical(other.emoji, emoji) || other.emoji == emoji));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, baseIncome, baseCost, count, depthRequired, emoji);

  /// Create a copy of Worker
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkerImplCopyWith<_$WorkerImpl> get copyWith =>
      __$$WorkerImplCopyWithImpl<_$WorkerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkerImplToJson(
      this,
    );
  }
}

abstract class _Worker extends Worker {
  const factory _Worker(
      {required final String id,
      required final String name,
      required final int baseIncome,
      required final int baseCost,
      final int count,
      final int depthRequired,
      final String emoji}) = _$WorkerImpl;
  const _Worker._() : super._();

  factory _Worker.fromJson(Map<String, dynamic> json) = _$WorkerImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int get baseIncome;
  @override
  int get baseCost;
  @override
  int get count;
  @override
  int get depthRequired;
  @override
  String get emoji;

  /// Create a copy of Worker
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkerImplCopyWith<_$WorkerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
