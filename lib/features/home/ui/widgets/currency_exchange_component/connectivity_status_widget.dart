import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';

class ConnectivityStatusWidget extends StatelessWidget {
  const ConnectivityStatusWidget({
    super.key,
    required this.isConnected,
  });

  final bool isConnected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(
            vertical: 3,
            horizontal: 4.5,
          ),
          decoration: BoxDecoration(
              color: isConnected ? AppColors.appGreenColor : AppColors.appRedColor,
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.primaryColor,
                  spreadRadius: .5,
                  blurRadius: .5,
                )
              ]),
          child: Text(
            isConnected ? 'Connected' : 'Disconnected',
            style: AppTextStyle.textStyle10.copyWith(
              color: AppColors.secondaryColor,
              fontWeight: FontWeight.w700,
              fontSize: 10.3,
            ),
          ),
        ),
      ],
    );
  }
}
