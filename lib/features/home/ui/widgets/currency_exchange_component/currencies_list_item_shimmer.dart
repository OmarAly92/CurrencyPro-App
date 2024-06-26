import 'package:currencypro/core/widgets/shimmer_text_container.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/widgets/app_shimmer.dart';

class CurrenciesListItemShimmer extends StatelessWidget {
  const CurrenciesListItemShimmer({super.key, this.image});

  final String? image;

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(color: Colors.black45),
          ],
        ),
        child: ListTile(
          leading: Image.asset(
            height: 35,
            image ?? AppImages.currencyImage,
          ),
          title: const Row(
            children: [
              ShimmerTextContainer(width: 140),
            ],
          ),
          subtitle: const Row(
            children: [
              ShimmerTextContainer(width: 80),
            ],
          ),
        ),
      ),
    );
  }
}
