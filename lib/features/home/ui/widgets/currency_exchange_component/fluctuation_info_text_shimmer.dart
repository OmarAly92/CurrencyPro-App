import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';

class FluctuationInfoTextShimmer extends StatelessWidget {
  const FluctuationInfoTextShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.keyboard_arrow_down,
          size: 22,
        ),
        RichText(
          text: TextSpan(
            style: AppTextStyle.textStyle10.copyWith(
              fontWeight: FontWeight.w500,
            ),
            children: [
              const TextSpan(text: 'Buying price'),
              const TextSpan(text: ' '),
              TextSpan(
                text: '',
                style: AppTextStyle.textStyle10.copyWith(
                  color: AppColors.appBlueColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const TextSpan(text: '  '),
              TextSpan(
                text: ' ',
                style: AppTextStyle.textStyle10.copyWith(
                  color: AppColors.appGreenColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
