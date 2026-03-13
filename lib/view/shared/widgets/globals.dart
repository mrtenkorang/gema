import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:get/get.dart';

class Globals {
  static void startLoading(BuildContext context) {
    final theme = Theme.of(context);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: ClipOval(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface.withOpacity(0.7),
                shape: BoxShape.circle,
              ),
              child: CircularProgressIndicator(
                color: theme.colorScheme.primary,
                strokeWidth: 8,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Hide loading indicator
  static void endLoading(BuildContext context) {
    Navigator.of(context).pop();
  }

  // Show snackbar with theme integration
  static void showSnackBar({
    required String title,
    required String message,
    int duration = 3,
    Color? backgroundColor,
    Color? textColor,
    bool boldFontWeight = false,
    SnackPosition position = SnackPosition.TOP,
  }) {
    final theme = Theme.of(Get.context!);

    Get.snackbar(
      title,
      message,
      titleText: Text(
        title,
      ),
      messageText: Text(
        message,
      ),
      snackPosition: position,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      backgroundColor: backgroundColor ?? theme.colorScheme.primary,
      duration: Duration(seconds: duration),
      borderRadius: 8,
      animationDuration: const Duration(milliseconds: 300),
    );
  }





  }
