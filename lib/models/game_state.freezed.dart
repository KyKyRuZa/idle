// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GameState _$GameStateFromJson(Map<String, dynamic> json) {
  return _GameState.fromJson(json);
}

/// @nodoc
mixin _$GameState {
  int get gold => throw _privateConstructorUsedError;
  int get totalGoldEarned => throw _privateConstructorUsedError;
  int get depth => throw _privateConstructorUsedError;
  int get depthMultiplier => throw _privateConstructorUsedError;
  int get prestigeMultiplier => throw _privateConstructorUsedError;
  int get tapPower => throw _privateConstructorUsedError;
  int get critChance => throw _privateConstructorUsedError;
  int? get prestigePoints => throw _privateConstructorUsedError;
  int? get lastSavedTime => throw _privateConstructorUsedError;
  int? get lastBonusClaimTime => throw _privateConstructorUsedError;
  int get consecutiveDays => throw _privateConstructorUsedError;
  int? get autoTapMinutesRemaining => throw _privateConstructorUsedError;
  int? get multiplierEndTime => throw _privateConstructorUsedError;
  bool get musicEnabled => throw _privateConstructorUsedError;
  bool get soundsEnabled => throw _privateConstructorUsedError;
  bool get effectsEnabled => throw _privateConstructorUsedError;
  bool get vibrationEnabled => throw _privateConstructorUsedError;
  int get workerCostDiscount => throw _privateConstructorUsedError;
  int get autoTapTicks => throw _privateConstructorUsedError;
  int get critMultiplier => throw _privateConstructorUsedError;

  /// Serializes this GameState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameStateCopyWith<GameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) =
      _$GameStateCopyWithImpl<$Res, GameState>;
  @useResult
  $Res call(
      {int gold,
      int totalGoldEarned,
      int depth,
      int depthMultiplier,
      int prestigeMultiplier,
      int tapPower,
      int critChance,
      int? prestigePoints,
      int? lastSavedTime,
      int? lastBonusClaimTime,
      int consecutiveDays,
      int? autoTapMinutesRemaining,
      int? multiplierEndTime,
      bool musicEnabled,
      bool soundsEnabled,
      bool effectsEnabled,
      bool vibrationEnabled,
      int workerCostDiscount,
      int autoTapTicks,
      int critMultiplier});
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res, $Val extends GameState>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gold = null,
    Object? totalGoldEarned = null,
    Object? depth = null,
    Object? depthMultiplier = null,
    Object? prestigeMultiplier = null,
    Object? tapPower = null,
    Object? critChance = null,
    Object? prestigePoints = freezed,
    Object? lastSavedTime = freezed,
    Object? lastBonusClaimTime = freezed,
    Object? consecutiveDays = null,
    Object? autoTapMinutesRemaining = freezed,
    Object? multiplierEndTime = freezed,
    Object? musicEnabled = null,
    Object? soundsEnabled = null,
    Object? effectsEnabled = null,
    Object? vibrationEnabled = null,
    Object? workerCostDiscount = null,
    Object? autoTapTicks = null,
    Object? critMultiplier = null,
  }) {
    return _then(_value.copyWith(
      gold: null == gold
          ? _value.gold
          : gold // ignore: cast_nullable_to_non_nullable
              as int,
      totalGoldEarned: null == totalGoldEarned
          ? _value.totalGoldEarned
          : totalGoldEarned // ignore: cast_nullable_to_non_nullable
              as int,
      depth: null == depth
          ? _value.depth
          : depth // ignore: cast_nullable_to_non_nullable
              as int,
      depthMultiplier: null == depthMultiplier
          ? _value.depthMultiplier
          : depthMultiplier // ignore: cast_nullable_to_non_nullable
              as int,
      prestigeMultiplier: null == prestigeMultiplier
          ? _value.prestigeMultiplier
          : prestigeMultiplier // ignore: cast_nullable_to_non_nullable
              as int,
      tapPower: null == tapPower
          ? _value.tapPower
          : tapPower // ignore: cast_nullable_to_non_nullable
              as int,
      critChance: null == critChance
          ? _value.critChance
          : critChance // ignore: cast_nullable_to_non_nullable
              as int,
      prestigePoints: freezed == prestigePoints
          ? _value.prestigePoints
          : prestigePoints // ignore: cast_nullable_to_non_nullable
              as int?,
      lastSavedTime: freezed == lastSavedTime
          ? _value.lastSavedTime
          : lastSavedTime // ignore: cast_nullable_to_non_nullable
              as int?,
      lastBonusClaimTime: freezed == lastBonusClaimTime
          ? _value.lastBonusClaimTime
          : lastBonusClaimTime // ignore: cast_nullable_to_non_nullable
              as int?,
      consecutiveDays: null == consecutiveDays
          ? _value.consecutiveDays
          : consecutiveDays // ignore: cast_nullable_to_non_nullable
              as int,
      autoTapMinutesRemaining: freezed == autoTapMinutesRemaining
          ? _value.autoTapMinutesRemaining
          : autoTapMinutesRemaining // ignore: cast_nullable_to_non_nullable
              as int?,
      multiplierEndTime: freezed == multiplierEndTime
          ? _value.multiplierEndTime
          : multiplierEndTime // ignore: cast_nullable_to_non_nullable
              as int?,
      musicEnabled: null == musicEnabled
          ? _value.musicEnabled
          : musicEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      soundsEnabled: null == soundsEnabled
          ? _value.soundsEnabled
          : soundsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      effectsEnabled: null == effectsEnabled
          ? _value.effectsEnabled
          : effectsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      vibrationEnabled: null == vibrationEnabled
          ? _value.vibrationEnabled
          : vibrationEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      workerCostDiscount: null == workerCostDiscount
          ? _value.workerCostDiscount
          : workerCostDiscount // ignore: cast_nullable_to_non_nullable
              as int,
      autoTapTicks: null == autoTapTicks
          ? _value.autoTapTicks
          : autoTapTicks // ignore: cast_nullable_to_non_nullable
              as int,
      critMultiplier: null == critMultiplier
          ? _value.critMultiplier
          : critMultiplier // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameStateImplCopyWith<$Res>
    implements $GameStateCopyWith<$Res> {
  factory _$$GameStateImplCopyWith(
          _$GameStateImpl value, $Res Function(_$GameStateImpl) then) =
      __$$GameStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int gold,
      int totalGoldEarned,
      int depth,
      int depthMultiplier,
      int prestigeMultiplier,
      int tapPower,
      int critChance,
      int? prestigePoints,
      int? lastSavedTime,
      int? lastBonusClaimTime,
      int consecutiveDays,
      int? autoTapMinutesRemaining,
      int? multiplierEndTime,
      bool musicEnabled,
      bool soundsEnabled,
      bool effectsEnabled,
      bool vibrationEnabled,
      int workerCostDiscount,
      int autoTapTicks,
      int critMultiplier});
}

/// @nodoc
class __$$GameStateImplCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$GameStateImpl>
    implements _$$GameStateImplCopyWith<$Res> {
  __$$GameStateImplCopyWithImpl(
      _$GameStateImpl _value, $Res Function(_$GameStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gold = null,
    Object? totalGoldEarned = null,
    Object? depth = null,
    Object? depthMultiplier = null,
    Object? prestigeMultiplier = null,
    Object? tapPower = null,
    Object? critChance = null,
    Object? prestigePoints = freezed,
    Object? lastSavedTime = freezed,
    Object? lastBonusClaimTime = freezed,
    Object? consecutiveDays = null,
    Object? autoTapMinutesRemaining = freezed,
    Object? multiplierEndTime = freezed,
    Object? musicEnabled = null,
    Object? soundsEnabled = null,
    Object? effectsEnabled = null,
    Object? vibrationEnabled = null,
    Object? workerCostDiscount = null,
    Object? autoTapTicks = null,
    Object? critMultiplier = null,
  }) {
    return _then(_$GameStateImpl(
      gold: null == gold
          ? _value.gold
          : gold // ignore: cast_nullable_to_non_nullable
              as int,
      totalGoldEarned: null == totalGoldEarned
          ? _value.totalGoldEarned
          : totalGoldEarned // ignore: cast_nullable_to_non_nullable
              as int,
      depth: null == depth
          ? _value.depth
          : depth // ignore: cast_nullable_to_non_nullable
              as int,
      depthMultiplier: null == depthMultiplier
          ? _value.depthMultiplier
          : depthMultiplier // ignore: cast_nullable_to_non_nullable
              as int,
      prestigeMultiplier: null == prestigeMultiplier
          ? _value.prestigeMultiplier
          : prestigeMultiplier // ignore: cast_nullable_to_non_nullable
              as int,
      tapPower: null == tapPower
          ? _value.tapPower
          : tapPower // ignore: cast_nullable_to_non_nullable
              as int,
      critChance: null == critChance
          ? _value.critChance
          : critChance // ignore: cast_nullable_to_non_nullable
              as int,
      prestigePoints: freezed == prestigePoints
          ? _value.prestigePoints
          : prestigePoints // ignore: cast_nullable_to_non_nullable
              as int?,
      lastSavedTime: freezed == lastSavedTime
          ? _value.lastSavedTime
          : lastSavedTime // ignore: cast_nullable_to_non_nullable
              as int?,
      lastBonusClaimTime: freezed == lastBonusClaimTime
          ? _value.lastBonusClaimTime
          : lastBonusClaimTime // ignore: cast_nullable_to_non_nullable
              as int?,
      consecutiveDays: null == consecutiveDays
          ? _value.consecutiveDays
          : consecutiveDays // ignore: cast_nullable_to_non_nullable
              as int,
      autoTapMinutesRemaining: freezed == autoTapMinutesRemaining
          ? _value.autoTapMinutesRemaining
          : autoTapMinutesRemaining // ignore: cast_nullable_to_non_nullable
              as int?,
      multiplierEndTime: freezed == multiplierEndTime
          ? _value.multiplierEndTime
          : multiplierEndTime // ignore: cast_nullable_to_non_nullable
              as int?,
      musicEnabled: null == musicEnabled
          ? _value.musicEnabled
          : musicEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      soundsEnabled: null == soundsEnabled
          ? _value.soundsEnabled
          : soundsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      effectsEnabled: null == effectsEnabled
          ? _value.effectsEnabled
          : effectsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      vibrationEnabled: null == vibrationEnabled
          ? _value.vibrationEnabled
          : vibrationEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      workerCostDiscount: null == workerCostDiscount
          ? _value.workerCostDiscount
          : workerCostDiscount // ignore: cast_nullable_to_non_nullable
              as int,
      autoTapTicks: null == autoTapTicks
          ? _value.autoTapTicks
          : autoTapTicks // ignore: cast_nullable_to_non_nullable
              as int,
      critMultiplier: null == critMultiplier
          ? _value.critMultiplier
          : critMultiplier // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameStateImpl extends _GameState {
  const _$GameStateImpl(
      {this.gold = 0,
      this.totalGoldEarned = 0,
      this.depth = 1,
      this.depthMultiplier = 1,
      this.prestigeMultiplier = 1,
      this.tapPower = 1,
      this.critChance = 10,
      this.prestigePoints,
      this.lastSavedTime,
      this.lastBonusClaimTime,
      this.consecutiveDays = 0,
      this.autoTapMinutesRemaining,
      this.multiplierEndTime,
      this.musicEnabled = true,
      this.soundsEnabled = true,
      this.effectsEnabled = true,
      this.vibrationEnabled = true,
      this.workerCostDiscount = 0,
      this.autoTapTicks = 1,
      this.critMultiplier = 5})
      : super._();

  factory _$GameStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameStateImplFromJson(json);

  @override
  @JsonKey()
  final int gold;
  @override
  @JsonKey()
  final int totalGoldEarned;
  @override
  @JsonKey()
  final int depth;
  @override
  @JsonKey()
  final int depthMultiplier;
  @override
  @JsonKey()
  final int prestigeMultiplier;
  @override
  @JsonKey()
  final int tapPower;
  @override
  @JsonKey()
  final int critChance;
  @override
  final int? prestigePoints;
  @override
  final int? lastSavedTime;
  @override
  final int? lastBonusClaimTime;
  @override
  @JsonKey()
  final int consecutiveDays;
  @override
  final int? autoTapMinutesRemaining;
  @override
  final int? multiplierEndTime;
  @override
  @JsonKey()
  final bool musicEnabled;
  @override
  @JsonKey()
  final bool soundsEnabled;
  @override
  @JsonKey()
  final bool effectsEnabled;
  @override
  @JsonKey()
  final bool vibrationEnabled;
  @override
  @JsonKey()
  final int workerCostDiscount;
  @override
  @JsonKey()
  final int autoTapTicks;
  @override
  @JsonKey()
  final int critMultiplier;

  @override
  String toString() {
    return 'GameState(gold: $gold, totalGoldEarned: $totalGoldEarned, depth: $depth, depthMultiplier: $depthMultiplier, prestigeMultiplier: $prestigeMultiplier, tapPower: $tapPower, critChance: $critChance, prestigePoints: $prestigePoints, lastSavedTime: $lastSavedTime, lastBonusClaimTime: $lastBonusClaimTime, consecutiveDays: $consecutiveDays, autoTapMinutesRemaining: $autoTapMinutesRemaining, multiplierEndTime: $multiplierEndTime, musicEnabled: $musicEnabled, soundsEnabled: $soundsEnabled, effectsEnabled: $effectsEnabled, vibrationEnabled: $vibrationEnabled, workerCostDiscount: $workerCostDiscount, autoTapTicks: $autoTapTicks, critMultiplier: $critMultiplier)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameStateImpl &&
            (identical(other.gold, gold) || other.gold == gold) &&
            (identical(other.totalGoldEarned, totalGoldEarned) ||
                other.totalGoldEarned == totalGoldEarned) &&
            (identical(other.depth, depth) || other.depth == depth) &&
            (identical(other.depthMultiplier, depthMultiplier) ||
                other.depthMultiplier == depthMultiplier) &&
            (identical(other.prestigeMultiplier, prestigeMultiplier) ||
                other.prestigeMultiplier == prestigeMultiplier) &&
            (identical(other.tapPower, tapPower) ||
                other.tapPower == tapPower) &&
            (identical(other.critChance, critChance) ||
                other.critChance == critChance) &&
            (identical(other.prestigePoints, prestigePoints) ||
                other.prestigePoints == prestigePoints) &&
            (identical(other.lastSavedTime, lastSavedTime) ||
                other.lastSavedTime == lastSavedTime) &&
            (identical(other.lastBonusClaimTime, lastBonusClaimTime) ||
                other.lastBonusClaimTime == lastBonusClaimTime) &&
            (identical(other.consecutiveDays, consecutiveDays) ||
                other.consecutiveDays == consecutiveDays) &&
            (identical(
                    other.autoTapMinutesRemaining, autoTapMinutesRemaining) ||
                other.autoTapMinutesRemaining == autoTapMinutesRemaining) &&
            (identical(other.multiplierEndTime, multiplierEndTime) ||
                other.multiplierEndTime == multiplierEndTime) &&
            (identical(other.musicEnabled, musicEnabled) ||
                other.musicEnabled == musicEnabled) &&
            (identical(other.soundsEnabled, soundsEnabled) ||
                other.soundsEnabled == soundsEnabled) &&
            (identical(other.effectsEnabled, effectsEnabled) ||
                other.effectsEnabled == effectsEnabled) &&
            (identical(other.vibrationEnabled, vibrationEnabled) ||
                other.vibrationEnabled == vibrationEnabled) &&
            (identical(other.workerCostDiscount, workerCostDiscount) ||
                other.workerCostDiscount == workerCostDiscount) &&
            (identical(other.autoTapTicks, autoTapTicks) ||
                other.autoTapTicks == autoTapTicks) &&
            (identical(other.critMultiplier, critMultiplier) ||
                other.critMultiplier == critMultiplier));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        gold,
        totalGoldEarned,
        depth,
        depthMultiplier,
        prestigeMultiplier,
        tapPower,
        critChance,
        prestigePoints,
        lastSavedTime,
        lastBonusClaimTime,
        consecutiveDays,
        autoTapMinutesRemaining,
        multiplierEndTime,
        musicEnabled,
        soundsEnabled,
        effectsEnabled,
        vibrationEnabled,
        workerCostDiscount,
        autoTapTicks,
        critMultiplier
      ]);

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith =>
      __$$GameStateImplCopyWithImpl<_$GameStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameStateImplToJson(
      this,
    );
  }
}

abstract class _GameState extends GameState {
  const factory _GameState(
      {final int gold,
      final int totalGoldEarned,
      final int depth,
      final int depthMultiplier,
      final int prestigeMultiplier,
      final int tapPower,
      final int critChance,
      final int? prestigePoints,
      final int? lastSavedTime,
      final int? lastBonusClaimTime,
      final int consecutiveDays,
      final int? autoTapMinutesRemaining,
      final int? multiplierEndTime,
      final bool musicEnabled,
      final bool soundsEnabled,
      final bool effectsEnabled,
      final bool vibrationEnabled,
      final int workerCostDiscount,
      final int autoTapTicks,
      final int critMultiplier}) = _$GameStateImpl;
  const _GameState._() : super._();

  factory _GameState.fromJson(Map<String, dynamic> json) =
      _$GameStateImpl.fromJson;

  @override
  int get gold;
  @override
  int get totalGoldEarned;
  @override
  int get depth;
  @override
  int get depthMultiplier;
  @override
  int get prestigeMultiplier;
  @override
  int get tapPower;
  @override
  int get critChance;
  @override
  int? get prestigePoints;
  @override
  int? get lastSavedTime;
  @override
  int? get lastBonusClaimTime;
  @override
  int get consecutiveDays;
  @override
  int? get autoTapMinutesRemaining;
  @override
  int? get multiplierEndTime;
  @override
  bool get musicEnabled;
  @override
  bool get soundsEnabled;
  @override
  bool get effectsEnabled;
  @override
  bool get vibrationEnabled;
  @override
  int get workerCostDiscount;
  @override
  int get autoTapTicks;
  @override
  int get critMultiplier;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
