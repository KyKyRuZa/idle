import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/game_state.dart';
import '../models/worker.dart';
import '../models/upgrade.dart';

class StorageService {
  static const String _gameStateKey = 'game_state';
  static const String _workersKey = 'workers';
  static const String _upgradesKey = 'upgrades';

  Future<void> saveGameState(GameState state) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_gameStateKey, jsonEncode(state.toJson()));
  }

  Future<GameState?> loadGameState() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_gameStateKey);
    if (jsonString == null) return null;
    return GameState.fromJson(jsonDecode(jsonString));
  }

  Future<void> saveWorkers(List<Worker> workers) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(workers.map((w) => w.toJson()).toList());
    await prefs.setString(_workersKey, jsonString);
  }

  Future<List<Worker>> loadWorkers() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_workersKey);
    if (jsonString == null) return [];
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((json) => Worker.fromJson(json)).toList();
  }

  Future<void> saveUpgrades(List<Upgrade> upgrades) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(upgrades.map((u) => u.toJson()).toList());
    await prefs.setString(_upgradesKey, jsonString);
  }

  Future<List<Upgrade>> loadUpgrades() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_upgradesKey);
    if (jsonString == null) return [];
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((json) => Upgrade.fromJson(json)).toList();
  }
}