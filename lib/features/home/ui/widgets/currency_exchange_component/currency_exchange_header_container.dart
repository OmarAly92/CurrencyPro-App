import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class CurrencyExchangeHeaderContainer extends StatelessWidget {
  const CurrencyExchangeHeaderContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(vertical: 25),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            spreadRadius: .5,
            blurRadius: 4,
          )
        ],
      ),
      child: child,
    );
  }
}
