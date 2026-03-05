import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gema/view/map-screeen/map_screen.dart';
import 'package:gema/view/theme/theme.dart';
import 'package:gema/view/theme/theme_controller.dart';
import 'package:get/get.dart';

void main() {
  // Initialize theme controller
  Get.put(ThemeController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();


    return Obx((){
      final themeMode = themeController.currentThemeMode.value;
      final isDark = themeMode == ThemeMode.dark;

      return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: isDark ? Colors.black : AppColors.secondary2Color,
          statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
          systemNavigationBarColor: isDark ? Colors.black : AppColors.secondary2Color,
          systemNavigationBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        ),
        child: GetMaterialApp(
          title: 'gema',
          theme: AppTheme.lightTheme,
          // darkTheme: AppTheme.darkTheme,
          themeMode: themeMode,
          home: MapScreen(),
        ),
      );
    });
  }
}

