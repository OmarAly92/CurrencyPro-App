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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox.shrink(),
        Column(
          children: [
            const Icon(
              Icons.error_outline,
              color: AppColors.appBlueColor,
              size: 250,
            ),
            const Gap(10),
            Text(
              failureMsg ?? '',
              textAlign: TextAlign.center,
              maxLines: 3,
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(30),
            Builder(builder: (context) {
              if (onPressed != null) {
                return Column(
                  children: [
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
                        backgroundColor: AppColors.appBlueColor,
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 55,
                        ),
                      ),
                      onPressed: onPressed,
                      child: const Text(
                        'Reload Screen',
                        style: TextStyle(
                          color: AppColors.secondaryColor,
                          // color: AppColors.appBlueColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return const SizedBox.shrink();
              }
            }),
          ],
        ),
        const SizedBox(height: 100),
      ],
    );
  }
}
