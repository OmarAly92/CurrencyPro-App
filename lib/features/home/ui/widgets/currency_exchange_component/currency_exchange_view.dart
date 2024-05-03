import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'currency_exchange_header.dart';
import 'sliver_currencies_list.dart';

class CurrencyExchangeView extends StatelessWidget {
  const CurrencyExchangeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: Gap(25)),
              SliverToBoxAdapter(child: CurrencyExchangeHeader()),
              SliverToBoxAdapter(child: Gap(25)),
              SliverCurrenciesList(),
            ],
          ),
        ),
      ),
    );
  }
}
