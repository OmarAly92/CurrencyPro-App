import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primaryColor = Color(0xff131316);
  static const Color secondaryColor = Color(0xff212126);
  static const Color appBlueColor = Color(0xFF007AFF);
  static Color disableBlueColor = const Color(0xFF007AFF).withOpacity(.35);
  static Color appGreenColor = CupertinoColors.activeGreen;
  static Color appRedColor = CupertinoColors.destructiveRed;
  static const Color appBlueSecondaryColor = Color(0xff001664);
  static Color hint = Colors.grey;
  static Color whiteColor = Colors.white;

  /// other color suggestion
// static Color primaryColor = const Color(0xff232526);
// static Color secondaryColor = const Color(0xff323435);
}
