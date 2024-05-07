import 'package:currencypro/features/home/ui/widgets/currency_exchange_component/currency_price_and_compare_texts_shimmer.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import 'currencies_and_black_market_texts.dart';

class CurrencyExchangeHeaderShimmer extends StatelessWidget {
  const CurrencyExchangeHeaderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(vertical: 25),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: AppColors.secondaryColor),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CurrenciesAndBlackMarketTexts(),
          CurrencyPriceAndCompareTextsShimmer(),
        ],
      ),
    );
  }
}
