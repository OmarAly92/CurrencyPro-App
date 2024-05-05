import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../utils/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    this.textStyle,
    this.backgroundColor,
    this.foregroundColor,
    this.textColor,
    this.borderRadius,
    required this.onPressed,
    this.isExpand = false,
    this.padding,
    this.isLoading = false,
  });

  const AppButton.expand({
    super.key,
    required this.text,
    this.textStyle,
    this.backgroundColor,
    this.foregroundColor,
    this.textColor,
    this.borderRadius,
    required this.onPressed,
    this.isExpand = true,
    this.padding,
    this.isLoading = false,
  });

  final String text;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? textColor;
  final bool isExpand;
  final bool isLoading;
  final BorderRadiusGeometry? borderRadius;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    if (isExpand) {
      return Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: padding,
                foregroundColor: foregroundColor ?? Colors.white,
                backgroundColor: backgroundColor ?? AppColors.appBlueColor,
                disabledBackgroundColor: backgroundColor ?? AppColors.appBlueColor,
                disabledForegroundColor: foregroundColor ?? Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: borderRadius ?? BorderRadius.circular(5),
                ),
              ),
              onPressed: isLoading ? () {} : onPressed,
              child: isLoading
                  ? Center(
                      child: SpinKitThreeBounce(
                        color: AppColors.whiteColor,
                        size: 35,
                      ),
                    )
                  : FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        text,
                        style: textStyle ??
                            TextStyle(
                              color: textColor ?? Colors.white,
                            ),
                      ),
                    ),
            ),
          ),
        ],
      );
    } else {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: padding,
          foregroundColor: foregroundColor ?? Colors.white,
          backgroundColor: backgroundColor ?? AppColors.appBlueColor,
          disabledBackgroundColor: backgroundColor ?? AppColors.appBlueColor,
          disabledForegroundColor: foregroundColor ?? Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(5),
          ),
        ),
        onPressed: isLoading ? () {} : onPressed,
        child: isLoading
            ? SpinKitThreeBounce(
                color: AppColors.whiteColor,
                size: 35,
              )
            : FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  text,
                  style: textStyle ??
                      TextStyle(
                        color: textColor ?? Colors.white,
                      ),
                ),
              ),
      );
    }
  }
}
