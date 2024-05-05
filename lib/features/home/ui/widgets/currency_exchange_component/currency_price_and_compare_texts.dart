import 'package:currencypro/core/utils/app_colors.dart';
import 'package:currencypro/core/utils/app_strings.dart';
import 'package:currencypro/core/utils/app_text_style.dart';
import 'package:currencypro/features/home/logic/currency_exchange_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/fluctuation_currencies_model.dart';
import 'fluctuation_info_text.dart';

class CurrencyPriceAndCompareTexts extends StatelessWidget {
  const CurrencyPriceAndCompareTexts({
    super.key,
    required this.currencyExchangeModel,
  });

  final FluctuationCurrenciesModel currencyExchangeModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: RichText(
            text: TextSpan(
              style: AppTextStyle.textStyle120.copyWith(
                color: AppColors.appBlueColor,
                fontWeight: FontWeight.w600,
              ),
              children: [
                TextSpan(text: currencyExchangeModel.rates![AppStrings.egp]!.endRate.toStringAsFixed(2)),
                TextSpan(
                  text: context.read<CurrencyExchangeCubit>().symbols,
                  style: AppTextStyle.textStyle10.copyWith(
                    color: AppColors.appBlueColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        FluctuationInfoText(currencyExchangeModel: currencyExchangeModel),
      ],
    );
  }
}
