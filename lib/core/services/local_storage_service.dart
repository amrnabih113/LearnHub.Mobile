import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {

  // Get From Dependency Injection
  final SharedPreferences _prefs;

  LocalStorageService(this._prefs);

  // ============================================================
  // INITIALIZATION
  // ============================================================

  static Future<LocalStorageService> init() async {
    final prefs = await SharedPreferences.getInstance();
    return LocalStorageService(prefs);
  }

  // ============================================================
  // STRING
  // ============================================================

  Future<bool> setString(String key, String value) {
    return _prefs.setString(key, value);
  }

  String? getString(String key, {String? defaultValue}) {
    return _prefs.getString(key) ?? defaultValue;
  }

  // ============================================================
  // INT
  // ============================================================

  Future<bool> setInt(String key, int value) {
    return _prefs.setInt(key, value);
  }

  int? getInt(String key, {int? defaultValue}) {
    return _prefs.getInt(key) ?? defaultValue;
  }

  // ============================================================
  // DOUBLE
  // ============================================================

  Future<bool> setDouble(String key, double value) {
    return _prefs.setDouble(key, value);
  }

  double? getDouble(String key, {double? defaultValue}) {
    return _prefs.getDouble(key) ?? defaultValue;
  }

  // ============================================================
  // BOOL
  // ============================================================

  Future<bool> setBool(String key, bool value) {
    return _prefs.setBool(key, value);
  }

  bool? getBool(String key, {bool? defaultValue}) {
    return _prefs.getBool(key) ?? defaultValue;
  }

  // ============================================================
  // STRING LIST
  // ============================================================

  Future<bool> setStringList(
    String key,
    List<String> value,
  ) {
    return _prefs.setStringList(key, value);
  }

  List<String>? getStringList(
    String key, {
    List<String>? defaultValue,
  }) {
    return _prefs.getStringList(key) ?? defaultValue;
  }

  // ============================================================
  // GENERIC
  // ============================================================

  bool contains(String key) {
    return _prefs.containsKey(key);
  }

  Future<bool> remove(String key) {
    return _prefs.remove(key);
  }

  // ============================================================
  // CLEAR
  // ============================================================

  Future<bool> clear() {
    return _prefs.clear();
  }

  // ============================================================
  // ALL KEYS
  // ============================================================

  Set<String> get keys => _prefs.getKeys();
}