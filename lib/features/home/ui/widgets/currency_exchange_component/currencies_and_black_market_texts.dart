import 'package:currencypro/core/utils/app_colors.dart';
import 'package:currencypro/core/utils/app_constants.dart';
import 'package:currencypro/core/utils/app_text_style.dart';
import 'package:currencypro/features/home/logic/connectivity_cubit/connectivity_cubit.dart';
import 'package:currencypro/features/home/ui/widgets/currency_exchange_component/convert_currency_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/global.dart';

class CurrenciesAndBlackMarketTexts extends StatelessWidget {
  const CurrenciesAndBlackMarketTexts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$fluctuationBase / ${fluctuationBase == symbols ? 'EUR' : symbols}',
                style: AppTextStyle.textStyle19.copyWith(
                  color: AppColors.appBlueColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              BlocBuilder<ConnectivityCubit, bool>(
                builder: (context, state) {
                  return IconButton(
                    style: ElevatedButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: state
                        ? () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return const ConvertCurrencyBottomSheet();
                              },
                            );
                          }
                        : null,
                    icon: Icon(
                      Icons.calculate_outlined,
                      color: state ? AppColors.appBlueColor : AppColors.disableBlueColor,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            'Today in the Black Market in ${AppConstants.getCurrencyNameBySymbol(symbols)}',
          ),
        ),
      ],
    );
  }
}
