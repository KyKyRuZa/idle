class GameConfig {
  static const int maxDepth = 5;
  static const int prestigeThreshold = 500000;
  static const int maxOfflineSeconds = 8 * 60 * 60;
  static const double workerCostGrowthFactor = 1.15;
  static const int saveIntervalSeconds = 10;
  static const int incomeTickSeconds = 1;

  static const List<int> depthCosts = [500, 2000, 10000, 50000, 250000];

  static const List<int> dailyBonusRewards = [50, 100, 200, 500, 0, 0, 0];
  static const int autoTapRewardMinutes = 30;
  static const int multiplierRewardHours = 1;
}