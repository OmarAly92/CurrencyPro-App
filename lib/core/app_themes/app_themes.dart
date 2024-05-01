import 'package:currencypro/core/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppThemes {
  static ThemeData dark() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.primaryColor,
      primaryTextTheme: Typography.whiteCupertino,
      iconTheme: const IconThemeData(color: Colors.white),
      popupMenuTheme: PopupMenuThemeData(color: AppColors.secondaryColor),
      dialogTheme: DialogTheme(
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
      tabBarTheme: TabBarTheme(
        dividerColor: AppColors.secondaryColor,
        indicatorColor: AppColors.appBlueColor,
        unselectedLabelColor: Colors.white,
        labelColor: AppColors.appBlueColor,
      ),
      appBarTheme: AppBarTheme(
        color: AppColors.secondaryColor,
        actionsIconTheme: const IconThemeData(color: Colors.white),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.secondaryColor,
        unselectedIconTheme: const IconThemeData(color: Colors.white),
        unselectedItemColor: Colors.white,
        unselectedLabelStyle: const TextStyle(color: Colors.white),
      ),
      useMaterial3: true,
      fontFamily: "Cairo",
      hintColor: Colors.white,
      textTheme: GoogleFonts.poppinsTextTheme(
        const TextTheme(
          headlineLarge: TextStyle(color: Colors.white),
          titleSmall: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
