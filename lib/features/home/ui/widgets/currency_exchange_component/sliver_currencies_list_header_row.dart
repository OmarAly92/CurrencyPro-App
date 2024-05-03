import 'package:currencypro/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class SliverCurrenciesListHeaderRow extends StatelessWidget {
  const SliverCurrenciesListHeaderRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Text(
        'Currencies',
        style: AppTextStyle.textStyle19.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
