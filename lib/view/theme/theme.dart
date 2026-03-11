
import 'package:flutter/material.dart';

class AppColors {
  // Green dominant colors
  static const Color greenColor = Color(0xFF0b6623);
  static const Color greenColor2 = Color(0xFF0b6623); // Dominant color
  static const Color greenColor3 = Color(0xFF62a7a0);
  static const Color greenColor4 = Color(0xFF76b2ac);

  // Neutral colors
  static const Color secondaryColor = Color(0xFFEDEDED);
  static const Color secondary2Color = Color(0xFFdfe0df);
  static const Color whiteColor = Color(0xFFfcfcfc);
  static const Color seaShellWhiteColor = Color(0xFFfaf9f5);
  static const Color whiteColor2 = Color(0xFFf7fcfe);
  static const Color blackColor = Color(0xFF353839);
  static const Color greyColor = Color(0xFFc5c6d0);
  static const Color transparent = Color(0x00000000);
  static const Color redColor = Color(0xFFFF0000);

  // Additional colors
  static const Color fillColor = Color(0xFFfff6e8);
  static const Color fillColor2 = Color(0xFFffffff);
  static const Color firstEvacuationColor = Color(0xFFeef7e4);
  static const Color buttonColor = Color(0xFFa6dd75);
  static const Color vanilla = Color(0xFFf3e5ab);
  static const Color cornik = Color(0xFFfff8dc);
  static const Color paperWhite = Color(0xFFf7fcfe);
  static const Color fundingColor1 = Color(0xFFc2b789);
  static const Color fundingColor2 = Color(0xFFdbce9a);
  static const Color fundingColor3 = Color(0xFFf3e5ab);
}

class AppTheme {
  // Define your font family
  static const String fontFamily = 'Montserrat'; // Replace with your actual font family

  static TextTheme _buildTextTheme(TextTheme base, Color textColor) {
    return base.copyWith(
      displayLarge: base.displayLarge?.copyWith(
        fontFamily: fontFamily,
        color: textColor,
      ),
      displayMedium: base.displayMedium?.copyWith(
        fontFamily: fontFamily,
        color: textColor,
      ),
      displaySmall: base.displaySmall?.copyWith(
        fontFamily: fontFamily,
        color: textColor,
      ),
      headlineMedium: base.headlineMedium?.copyWith(
        fontFamily: fontFamily,
        color: textColor,
      ),
      headlineSmall: base.headlineSmall?.copyWith(
        fontFamily: fontFamily,
        color: textColor,
      ),
      titleLarge: base.titleLarge?.copyWith(
        fontFamily: fontFamily,
        color: textColor,
      ),
      titleMedium: base.titleMedium?.copyWith(
        fontFamily: fontFamily,
        color: textColor,
      ),
      titleSmall: base.titleSmall?.copyWith(
        fontFamily: fontFamily,
        color: textColor,
      ),
      bodyLarge: base.bodyLarge?.copyWith(
        fontFamily: fontFamily,
        color: textColor,
      ),
      bodyMedium: base.bodyMedium?.copyWith(
        fontFamily: fontFamily,
        color: textColor,
      ),
      bodySmall: base.bodySmall?.copyWith(
        fontFamily: fontFamily,
        color: textColor,
      ),
      labelLarge: base.labelLarge?.copyWith(
        fontFamily: fontFamily,
        color: textColor,
      ),
      labelSmall: base.labelSmall?.copyWith(
        fontFamily: fontFamily,
        color: textColor,
      ),
    );
  }

  static final ThemeData lightTheme = ThemeData(
    fontFamily: fontFamily,
    primaryColor: AppColors.greenColor2,
    primaryColorDark: AppColors.greenColor,
    primaryColorLight: AppColors.greenColor3,
    secondaryHeaderColor: AppColors.vanilla,
    colorScheme: const ColorScheme.light(
      primary: AppColors.greenColor2,
      secondary: AppColors.greenColor3,
      surface: AppColors.seaShellWhiteColor,
      background: AppColors.seaShellWhiteColor,
      error: AppColors.redColor,
    ),
    scaffoldBackgroundColor: AppColors.secondary2Color,
    appBarTheme: const AppBarTheme(
      color: AppColors.greenColor2,
      iconTheme: IconThemeData(color: AppColors.whiteColor),
      titleTextStyle: TextStyle(
        fontFamily: fontFamily,
        color: AppColors.whiteColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    cardTheme: const CardThemeData(
      color: AppColors.whiteColor,
      elevation: 2,
      margin: EdgeInsets.all(8),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.greenColor2,
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.greenColor2,
        foregroundColor: AppColors.whiteColor,
        textStyle: const TextStyle(
          fontFamily: fontFamily,
          fontWeight: FontWeight.w500,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.greenColor2,
        textStyle: const TextStyle(
          fontFamily: fontFamily,
        ),
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.greenColor2,
    ),
    textTheme: _buildTextTheme(
      ThemeData.light().textTheme,
      AppColors.blackColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.greenColor3),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.greenColor3),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.greenColor2, width: 2),
      ),
      labelStyle: const TextStyle(
        fontFamily: fontFamily,
        color: AppColors.greenColor2,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    fontFamily: fontFamily,
    primaryColor: AppColors.greenColor3,
    primaryColorDark: AppColors.greenColor2,
    primaryColorLight: AppColors.greenColor4,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.greenColor3,
      secondary: AppColors.greenColor4,
      surface: AppColors.blackColor,
      background: Color(0xFF121212),
      error: AppColors.redColor,
    ),
    scaffoldBackgroundColor: const Color(0xFF121212),
    appBarTheme: const AppBarTheme(
      color: AppColors.greenColor3,
      iconTheme: IconThemeData(color: AppColors.whiteColor),
      titleTextStyle: TextStyle(
        fontFamily: fontFamily,
        color: AppColors.whiteColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    cardTheme: const CardThemeData(
      color: Color(0xFF1E1E1E),
      elevation: 2,
      margin: EdgeInsets.all(8),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.greenColor3,
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.greenColor3,
        foregroundColor: AppColors.whiteColor,
        textStyle: const TextStyle(
          fontFamily: fontFamily,
          fontWeight: FontWeight.w500,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.greenColor4,
        textStyle: const TextStyle(
          fontFamily: fontFamily,
        ),
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.greenColor3,
    ),
    textTheme: _buildTextTheme(
      ThemeData.dark().textTheme,
      AppColors.whiteColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.greenColor4),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.greenColor4),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.greenColor3, width: 2),
      ),
      labelStyle: const TextStyle(
        fontFamily: fontFamily,
        color: AppColors.greenColor3,
      ),
    ),
  );
}