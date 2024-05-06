import 'package:currencypro/core/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class AppThemes {
  static ThemeData dark() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.primaryColor,
      primaryTextTheme: Typography.whiteCupertino,
      iconTheme: const IconThemeData(color: Colors.white),
      popupMenuTheme: const PopupMenuThemeData(color: AppColors.secondaryColor),
      dialogTheme: const DialogTheme(
        backgroundColor: AppColors.primaryColor,
      ),
      radioTheme: const RadioThemeData(
        fillColor: MaterialStatePropertyAll<Color>(CupertinoColors.white),
      ),
      checkboxTheme: const CheckboxThemeData(
        fillColor: MaterialStatePropertyAll<Color>(CupertinoColors.white),
        checkColor: MaterialStatePropertyAll<Color>(CupertinoColors.white),
      ),
      colorScheme: ColorScheme.fromSeed(
        surface: AppColors.primaryColor,
        onSurface: Colors.white,
        primary: Colors.white,
        seedColor: Colors.white,
        surfaceTint: Colors.white,
      ),
      tabBarTheme: const TabBarTheme(
        dividerColor: AppColors.secondaryColor,
        indicatorColor: AppColors.appBlueColor,
        unselectedLabelColor: Colors.white,
        labelColor: AppColors.appBlueColor,
      ),
      appBarTheme: const AppBarTheme(
        color: AppColors.secondaryColor,
        actionsIconTheme: IconThemeData(color: Colors.white),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.secondaryColor,
        unselectedIconTheme: IconThemeData(color: Colors.white),
        unselectedItemColor: Colors.white,
        unselectedLabelStyle: TextStyle(color: Colors.white),
      ),
      useMaterial3: true,
      fontFamily: 'Poppins',
      hintColor: Colors.white,
    );
  }
}
