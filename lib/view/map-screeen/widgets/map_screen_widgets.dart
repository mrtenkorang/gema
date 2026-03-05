import 'package:flutter/material.dart';



Widget bottomChips({required BuildContext context, required String title, required int count,  Color? color}){
  final themeColor = color ?? Theme.of(context).primaryColor;
  final brightness = ThemeData.estimateBrightnessForColor(themeColor);
  final textColor = brightness == Brightness.dark ? Colors.white : Colors.black;

  return Container(
    width: 85,
    height: 85,
    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
    decoration: BoxDecoration(
      color: themeColor,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.15),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          count.toString(),
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: textColor.withOpacity(0.9),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}