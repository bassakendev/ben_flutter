// ignore_for_file: prefer_final_fields, file_names, constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class StoragesUtils {
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static const String THEME_KEY = 'theme';
  static const String MODE_KEY = 'mode';

  static Future<int> getTheme() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getInt(THEME_KEY) ?? 0;
  }

  static Future<void> setTheme(int theme) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setInt(THEME_KEY, theme);
  }

  static Future<bool> getMode() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getBool(MODE_KEY) ?? true;
  }

  static Future<void> setMode(bool mode) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setBool(MODE_KEY, mode);
  }
}
