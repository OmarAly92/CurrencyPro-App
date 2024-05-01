import 'package:currencypro/features/home/ui/currency_exchange_view.dart';
import 'package:currencypro/features/home/ui/gold_prices_view.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_text_style.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Today\'s Souq',
            style: AppTextStyle.textStyle23,
          ),
          flexibleSpace: const FlexibleSpaceBar(),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Currency Exchange'),
              Tab(text: 'Gold Prices'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CurrencyExchangeView(),
            GoldPricesView(),
          ],
        ),
      ),
    );
  }
}
