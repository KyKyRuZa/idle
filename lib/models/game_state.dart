class GameState {
  int gold;
  int totalGoldEarned;
  int depth;
  int depthMultiplier;
  int prestigeMultiplier;
  int tapPower;
  int critChance;
  int? prestigePoints;
  int? lastSavedTime;
  int? lastBonusClaimTime;
  int consecutiveDays;
  int? autoTapMinutesRemaining;
  int? multiplierEndTime;
  bool musicEnabled;
  bool soundsEnabled;
  bool effectsEnabled;
  bool vibrationEnabled;

  GameState({
    this.gold = 0,
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
  });

  Map<String, dynamic> toJson() => {
        'gold': gold,
        'totalGoldEarned': totalGoldEarned,
        'depth': depth,
        'depthMultiplier': depthMultiplier,
        'prestigeMultiplier': prestigeMultiplier,
        'tapPower': tapPower,
        'critChance': critChance,
        'prestigePoints': prestigePoints,
        'lastSavedTime': lastSavedTime,
        'lastBonusClaimTime': lastBonusClaimTime,
        'consecutiveDays': consecutiveDays,
        'autoTapMinutesRemaining': autoTapMinutesRemaining,
        'multiplierEndTime': multiplierEndTime,
        'musicEnabled': musicEnabled,
        'soundsEnabled': soundsEnabled,
        'effectsEnabled': effectsEnabled,
        'vibrationEnabled': vibrationEnabled,
      };

  factory GameState.fromJson(Map<String, dynamic> json) => GameState(
        gold: json['gold'] ?? 0,
        totalGoldEarned: json['totalGoldEarned'] ?? 0,
        depth: json['depth'] ?? 1,
        depthMultiplier: json['depthMultiplier'] ?? 1,
        prestigeMultiplier: json['prestigeMultiplier'] ?? 1,
        tapPower: json['tapPower'] ?? 1,
        critChance: json['critChance'] ?? 10,
        prestigePoints: json['prestigePoints'] as int?,
        lastSavedTime: json['lastSavedTime'] as int?,
        lastBonusClaimTime: json['lastBonusClaimTime'] as int?,
        consecutiveDays: json['consecutiveDays'] ?? 0,
        autoTapMinutesRemaining: json['autoTapMinutesRemaining'] as int?,
        multiplierEndTime: json['multiplierEndTime'] as int?,
        musicEnabled: json['musicEnabled'] ?? true,
        soundsEnabled: json['soundsEnabled'] ?? true,
        effectsEnabled: json['effectsEnabled'] ?? true,
        vibrationEnabled: json['vibrationEnabled'] ?? true,
      );

  GameState copyWith({
    int? gold,
    int? totalGoldEarned,
    int? depth,
    int? depthMultiplier,
    int? prestigeMultiplier,
    int? tapPower,
    int? critChance,
    int? prestigePoints,
    int? lastSavedTime,
    int? lastBonusClaimTime,
    int? consecutiveDays,
    int? autoTapMinutesRemaining,
    int? multiplierEndTime,
    bool? musicEnabled,
    bool? soundsEnabled,
    bool? effectsEnabled,
    bool? vibrationEnabled,
  }) {
    return GameState(
      gold: gold ?? this.gold,
      totalGoldEarned: totalGoldEarned ?? this.totalGoldEarned,
      depth: depth ?? this.depth,
      depthMultiplier: depthMultiplier ?? this.depthMultiplier,
      prestigeMultiplier: prestigeMultiplier ?? this.prestigeMultiplier,
      tapPower: tapPower ?? this.tapPower,
      critChance: critChance ?? this.critChance,
      prestigePoints: prestigePoints ?? this.prestigePoints,
      lastSavedTime: lastSavedTime ?? this.lastSavedTime,
      lastBonusClaimTime: lastBonusClaimTime ?? this.lastBonusClaimTime,
      consecutiveDays: consecutiveDays ?? this.consecutiveDays,
      autoTapMinutesRemaining: autoTapMinutesRemaining ?? this.autoTapMinutesRemaining,
      multiplierEndTime: multiplierEndTime ?? this.multiplierEndTime,
      musicEnabled: musicEnabled ?? this.musicEnabled,
      soundsEnabled: soundsEnabled ?? this.soundsEnabled,
      effectsEnabled: effectsEnabled ?? this.effectsEnabled,
      vibrationEnabled: vibrationEnabled ?? this.vibrationEnabled,
    );
  }
}