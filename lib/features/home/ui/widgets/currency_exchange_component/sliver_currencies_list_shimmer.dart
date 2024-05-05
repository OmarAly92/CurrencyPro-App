import 'package:currencypro/features/home/ui/widgets/currency_exchange_component/currencies_list_item_shimmer.dart';
import 'package:currencypro/core/widgets/shimmer_text_container.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SliverCurrenciesListShimmer extends StatelessWidget {
  const SliverCurrenciesListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(8),
        ShimmerTextContainer(),
        const Gap(17),
        const Column(
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
        const Gap(25),
      ],
    );
  }
}
