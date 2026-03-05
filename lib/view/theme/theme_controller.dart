// theme_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  final Rx<ThemeMode> currentThemeMode = ThemeMode.system.obs;
  final String _themeKey = 'selectedTheme';

  @override
  void onInit() {
    super.onInit();
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final themeIndex = prefs.getInt(_themeKey) ?? ThemeMode.system.index;
    currentThemeMode.value = ThemeMode.values[themeIndex];
    Get.changeThemeMode(currentThemeMode.value);
  }

  Future<void> changeThemeMode(ThemeMode mode) async {
    currentThemeMode.value = mode;
    Get.changeThemeMode(mode);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_themeKey, mode.index);
  }
}