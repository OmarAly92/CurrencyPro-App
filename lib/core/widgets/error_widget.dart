import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/app_colors.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({super.key, this.failureMsg, this.onPressed});

  final String? failureMsg;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error_outline,
          color: AppColors.primaryColor,
          size: 250,
        ),
        Text(
          failureMsg ?? 'nul',
          style: const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Gap(20),
        const Text(
          'Try Again',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Gap(20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 55,
            ),
          ),
          onPressed: onPressed,
          child: const Text(
            'Reload Screen',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        const Gap(200),
      ],
    );
  }
}
