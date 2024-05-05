import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';

class CurrencyPriceAndCompareTextsShimmer extends StatelessWidget {
  const CurrencyPriceAndCompareTextsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: RichText(
            text: TextSpan(
              style: AppTextStyle.textStyle120.copyWith(
                color: AppColors.appBlueColor,
                fontWeight: FontWeight.w600,
              ),
              children: [
                const TextSpan(text: '2000'),
                TextSpan(
                  text: ' ',
                  style: AppTextStyle.textStyle10.copyWith(
                    color: AppColors.appBlueColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
