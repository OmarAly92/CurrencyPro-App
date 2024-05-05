import 'package:currencypro/features/home/ui/widgets/currency_exchange_component/currencies_list_item_shimmer.dart';
import 'package:currencypro/core/widgets/shimmer_text_container.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SliverCurrenciesListShimmer extends StatelessWidget {
  const SliverCurrenciesListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(8),
        ShimmerTextContainer(),
        Gap(17),
        Column(
          children: [
            CurrenciesListItemShimmer(),
            Gap(10),
            CurrenciesListItemShimmer(),
            Gap(10),
            CurrenciesListItemShimmer(),
            Gap(10),
            CurrenciesListItemShimmer(),
          ],
        ),
        Gap(25),
      ],
    );
  }
}
