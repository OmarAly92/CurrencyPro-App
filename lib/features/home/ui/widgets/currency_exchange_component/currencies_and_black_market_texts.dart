import 'package:currencypro/core/utils/app_colors.dart';
import 'package:currencypro/core/utils/app_constants.dart';
import 'package:currencypro/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/global.dart';

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
            '$fluctuationBase / $symbols',
            style: AppTextStyle.textStyle19.copyWith(
              color: AppColors.appBlueColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            'Today in the Black Market in ${AppConstants.getCurrencyNameBySymbol(symbols)}',
          ),
        ),
      ],
    );
  }
}
