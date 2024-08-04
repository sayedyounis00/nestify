import 'package:flutter/material.dart';
import 'package:nestify/core/utils/theme/app_color.dart';

ThemeData getThemeDataLight() => ThemeData(
      primaryColor: AppColor.primaryColor,
      appBarTheme: appBarTheme(),
      textButtonTheme: textButtonTheme(),
      textTheme: textTheme(),
    );

TextButtonThemeData textButtonTheme() => const TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(AppColor.primaryColor),
      ),
    );
AppBarTheme appBarTheme() => const AppBarTheme(
      backgroundColor: AppColor.primaryColor,
    );
TextTheme textTheme() => const TextTheme(
      titleMedium: TextStyle(color: AppColor.secColor4),
    );
