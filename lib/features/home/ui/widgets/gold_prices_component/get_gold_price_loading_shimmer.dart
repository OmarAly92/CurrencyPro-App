import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_images.dart';
import '../currency_exchange_component/currencies_list_item_shimmer.dart';

class GetGoldPriceLoadingShimmer extends StatelessWidget {
  const GetGoldPriceLoadingShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(10),
        Column(
          children: List.generate(
            8,
            (index) {
              return const Column(
                children: [
                  SizedBox(height: 10),
                  CurrenciesListItemShimmer(
                    image: AppImages.goldImage,
                  ),
                ],
              );
            },
          ),
        ),
        const Gap(20),
      ],
    );
  }
}
