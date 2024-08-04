import 'package:flutter/material.dart';
import 'package:nestify/core/utils/theme/app_color.dart';

ThemeData getThemeDataLight() => ThemeData(
      primaryColor: AppColor.primaryColor,
      appBarTheme: appBarTheme(),
      textButtonTheme: textButtonTheme(),
    );

TextButtonThemeData textButtonTheme() => const TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppColor.primaryColor),
      ),
    );
AppBarTheme appBarTheme() => const AppBarTheme(
      backgroundColor: AppColor.primaryColor,
    );
