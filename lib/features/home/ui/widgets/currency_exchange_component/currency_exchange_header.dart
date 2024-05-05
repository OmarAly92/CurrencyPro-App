import 'package:flutter/material.dart';

import '../../../data/model/currency_exchange_models/fluctuation_currencies_model.dart';
import 'currencies_and_black_market_texts.dart';
import 'currency_exchange_header_container.dart';
import 'currency_price_and_compare_texts.dart';

class CurrencyExchangeHeader extends StatelessWidget {
  const CurrencyExchangeHeader({super.key, required this.fluctuationCurrencies});

  final FluctuationCurrenciesModel fluctuationCurrencies;

  @override
  Widget build(BuildContext context) {
    return CurrencyExchangeHeaderContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CurrenciesAndBlackMarketTexts(),
          CurrencyPriceAndCompareTexts(
            currencyExchangeModel: fluctuationCurrencies,
          ),
        ],
      ),
    );
  }
}
