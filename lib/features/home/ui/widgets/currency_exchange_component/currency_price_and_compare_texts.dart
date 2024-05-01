import 'package:currencypro/core/utils/app_colors.dart';
import 'package:currencypro/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CurrencyPriceAndCompareTexts extends StatelessWidget {
  const CurrencyPriceAndCompareTexts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            style: AppTextStyle.textStyle120.copyWith(
              color: AppColors.appBlueColor,
              fontWeight: FontWeight.w600,
            ),
            children: [
              const TextSpan(text: '48.08'),
              TextSpan(
                text: 'EGP',
                style: AppTextStyle.textStyle10.copyWith(
                  color: AppColors.appBlueColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.keyboard_arrow_up,
              color: AppColors.appGreenColor,
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
                    text: '48.33',
                    style: AppTextStyle.textStyle10.copyWith(
                      color: AppColors.appBlueColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const TextSpan(text: '  '),
                  TextSpan(
                    text: '+(0.05) Compared To The Last Price Yesterday',
                    style: AppTextStyle.textStyle10.copyWith(
                      color: AppColors.appGreenColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
