import 'package:currencypro/core/widgets/app_button.dart';
import 'package:currencypro/features/home/data/model/widgets_model/convert_currency_parameter_model.dart';
import 'package:currencypro/features/home/logic/currency_exchange_cubit/currency_exchange_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../data/model/widgets_model/convert_currency_bottom_sheet_controller_model.dart';

class ConvertCurrencyBottomSheetButton extends StatelessWidget {
  const ConvertCurrencyBottomSheetButton({
    super.key,
    required this.isLoading,
    required this.controllerModel,
  });

  final ConvertBottomSheetControllerModel controllerModel;

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButton.expand(
          text: 'Convert',
          isLoading: isLoading,
          onPressed: () {
            if (controllerModel.formKey.currentState!.validate()) {
              context.read<CurrencyExchangeCubit>().getConvertCurrency(
                    parameters: ConvertCurrencyParameterModel(
                      to: controllerModel.toController.text,
                      from: controllerModel.fromController.text,
                      amount: num.parse(
                        controllerModel.convertController.text,
                      ),
                    ),
                  );
            }
          },
        ),
        const Gap(10),
      ],
    );
  }
}
