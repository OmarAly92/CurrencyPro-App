import 'package:currencypro/core/utils/app_colors.dart';
import 'package:currencypro/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CurrenciesAndBlackMarketTexts extends StatelessWidget {
  const CurrenciesAndBlackMarketTexts({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            'USD / EGP',
            style: AppTextStyle.textStyle19.copyWith(
              color: AppColors.appBlueColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Text('Today in the Black Market in Egypt'),
        ),
      ],
    );
  }
}
