import 'package:flutter_riverpod/flutter_riverpod.dart';

final appInfoServiceProvider = Provider<AppInfoService>((ref) {
  return AppInfoService.instance;
});

class AppInfoService {
  AppInfoService._();
  static final AppInfoService instance = AppInfoService._();

  String get versionName => '1.0.0+1';
  String get versionCode => '1';
}