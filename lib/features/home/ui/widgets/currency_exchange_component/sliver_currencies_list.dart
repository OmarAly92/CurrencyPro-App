import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../data/model/currencies_list_item_model.dart';
import 'currencies_list_item.dart';
import 'sliver_currencies_list_title.dart';

class SliverCurrenciesList extends StatelessWidget {
  const SliverCurrenciesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<CurrenciesListItemModel> item = [
      const CurrenciesListItemModel(
        currencyName: 'United States Dollar',
        buyPrice: '48.33',
        sellPrice: '48.08',
      ),
      const CurrenciesListItemModel(
        currencyName: 'United States Dollar',
        buyPrice: '48.33',
        sellPrice: '48.08',
      ),
      const CurrenciesListItemModel(
        currencyName: 'United States Dollar',
        buyPrice: '48.33',
        sellPrice: '48.08',
      ),
      const CurrenciesListItemModel(
        currencyName: 'United States Dollar',
        buyPrice: '48.33',
        sellPrice: '48.08',
      ),
      const CurrenciesListItemModel(
        currencyName: 'United States Dollar',
        buyPrice: '48.33',
        sellPrice: '48.08',
      ),
    ];

    return MultiSliver(
      children: [
        const SliverCurrenciesListTitle(),
        const SliverToBoxAdapter(child: Gap(12)),
        SliverList.separated(
          itemCount: item.length,
          separatorBuilder: (BuildContext context, int index) => const Gap(10),
          itemBuilder: (context, index) {
            return CurrenciesListItem(currenciesListItemModel: item[index]);
          },
        ),
        const SliverToBoxAdapter(child: Gap(25)),
      ],
    );
  }
}
