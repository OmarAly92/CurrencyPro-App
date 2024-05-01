import 'package:currencypro/core/utils/app_colors.dart';
import 'package:currencypro/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class SliverCurrenciesListHeaderRow extends StatelessWidget {
  const SliverCurrenciesListHeaderRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Currencies',
            style: AppTextStyle.textStyle19.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          IconButton(
            style: ElevatedButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(
              Icons.currency_exchange,
              color: AppColors.appBlueColor,
            ),
          ),
        ],
      ),
    );
  }
}
