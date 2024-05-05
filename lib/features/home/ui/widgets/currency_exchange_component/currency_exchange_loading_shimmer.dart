import 'package:currencypro/core/widgets/app_shimmer.dart';
import 'package:currencypro/features/home/ui/widgets/currency_exchange_component/currency_exchange_header_shimmer.dart';
import 'package:currencypro/features/home/ui/widgets/currency_exchange_component/sliver_currencies_list_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CurrencyExchangeLoadingShimmer extends StatelessWidget {
  const CurrencyExchangeLoadingShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(25),
        AppShimmer(child: CurrencyExchangeHeaderShimmer()),
        Gap(25),
        SliverCurrenciesListShimmer(),
      ],
    );
  }
}
