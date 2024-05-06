import 'package:currencypro/core/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../data/model/currency_exchange_models/fluctuation_currencies_model.dart';
import 'currencies_and_black_market_texts.dart';
import 'currency_exchange_header_container.dart';
import 'currency_price_and_compare_texts.dart';

class CurrencyExchangeHeader extends StatelessWidget {
  const CurrencyExchangeHeader({super.key, required this.fluctuationCurrencies});

  final FluctuationCurrenciesModel fluctuationCurrencies;

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.synchronized(
      duration: const Duration(milliseconds: 100),
      child: SlideAnimation(
        duration: const Duration(milliseconds: AppConstants.slideAnimation),
        child: FadeInAnimation(
          duration: const Duration(milliseconds: AppConstants.fadInAnimation),
          child: CurrencyExchangeHeaderContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CurrenciesAndBlackMarketTexts(),
                CurrencyPriceAndCompareTexts(
                  currencyExchangeModel: fluctuationCurrencies,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
