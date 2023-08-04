// ignore_for_file: prefer_final_fields, file_names, constant_identifier_names

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'Task.dart';

class StoragesUtils {
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static const String THEME_KEY = 'theme';
  static const String MODE_KEY = 'mode';
  static const String LANG_KEY = 'lang';

  static Future<int> getTheme() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getInt(THEME_KEY) ?? 7;
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

  static Future<String> getLang() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(LANG_KEY) ?? 'en';
  }

  static Future<void> setLang(String lang) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString(LANG_KEY, lang);
  }

  static Future<void> saveTasks(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final taskList = tasks.map((task) => task.toJson()).toList();
    await prefs.setString('tasks', json.encode(taskList));
  }

  static Future<List<Task>> getTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final taskListJSON = prefs.getString('tasks');
    if (taskListJSON != null) {
      final taskList = json.decode(taskListJSON) as List<dynamic>;
      return taskList.map((taskJson) => Task.fromJson(taskJson)).toList();
    } else {
      return [];
    }
  }
}
