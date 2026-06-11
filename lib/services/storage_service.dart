import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/game_state.dart';
import '../models/worker.dart';
import '../models/upgrade.dart';

class StorageService {
  StorageService._();
  static final StorageService instance = StorageService._();

  static const String _gameStateKey = 'game_state';
  static const String _workersKey = 'workers';
  static const String _upgradesKey = 'upgrades';

  Future<void> saveGameState(GameState state) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_gameStateKey, jsonEncode(state.toJson()));
  }

  Future<GameState?> loadGameState() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = prefs.getString(_gameStateKey);
      if (jsonString == null) return null;
      return GameState.fromJson(jsonDecode(jsonString));
    } catch (e) {
      return null;
    }
  }

  Future<void> saveWorkers(List<Worker> workers) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = jsonEncode(workers.map((w) => w.toJson()).toList());
      await prefs.setString(_workersKey, jsonString);
    } catch (e) {
      // Silently fail - will use defaults
    }
  }

  Future<List<Worker>> loadWorkers() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = prefs.getString(_workersKey);
      if (jsonString == null) return [];
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((json) => Worker.fromJson(json)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<void> saveUpgrades(List<Upgrade> upgrades) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = jsonEncode(upgrades.map((u) => u.toJson()).toList());
      await prefs.setString(_upgradesKey, jsonString);
    } catch (e) {
      // Silently fail - will use defaults
    }
  }

  Future<List<Upgrade>> loadUpgrades() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = prefs.getString(_upgradesKey);
      if (jsonString == null) return [];
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((json) => Upgrade.fromJson(json)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_gameStateKey);
    await prefs.remove(_workersKey);
    await prefs.remove(_upgradesKey);
  }
}