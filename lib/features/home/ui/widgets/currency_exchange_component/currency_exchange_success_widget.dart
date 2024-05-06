import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../logic/currency_exchange_cubit/currency_exchange_cubit.dart';
import 'currency_exchange_header.dart';
import 'sliver_currencies_list.dart';

class CurrencyExchangeSuccessWidget extends StatelessWidget {
  const CurrencyExchangeSuccessWidget({
    super.key,
    required this.state,
  });

  final GetCurrencyExchangeSuccess state;

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        const SliverToBoxAdapter(child: Gap(25)),
        SliverToBoxAdapter(
          child: CurrencyExchangeHeader(
            fluctuationCurrencies: state.fluctuationCurrencies,
          ),
        ),
        const SliverToBoxAdapter(child: Gap(25)),
        SliverCurrenciesList(allCurrenciesModel: state.allCurrencies),
      ],
    );
  }
}
