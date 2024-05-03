import 'package:flutter/material.dart';

import 'currencies_and_black_market_texts.dart';
import 'currency_exchange_header_container.dart';
import 'currency_price_and_compare_texts.dart';

class CurrencyExchangeHeader extends StatelessWidget {
  const CurrencyExchangeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const CurrencyExchangeHeaderContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CurrenciesAndBlackMarketTexts(),
          CurrencyPriceAndCompareTexts(),
        ],
      ),
    );
  }
}
