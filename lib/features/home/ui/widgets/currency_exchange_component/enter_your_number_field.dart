import 'package:currencypro/core/utils/app_text_style.dart';
import 'package:currencypro/core/widgets/app_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../data/model/widgets_model/convert_currency_bottom_sheet_controller_model.dart';
import '../../../data/model/widgets_model/convert_currency_parameter_model.dart';
import '../../../logic/currency_exchange_cubit/currency_exchange_cubit.dart';

class EnterYourNumberField extends StatelessWidget {
  const EnterYourNumberField({
    super.key,
    required this.controllerModel,
  });

  final ConvertBottomSheetControllerModel controllerModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Convert Money',
          style: AppTextStyle.textStyle17.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const Gap(10),
        AppTextField(
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp(r'\s')),
            FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+$')),
          ],
          controller: controllerModel.convertController,
          hint: 'Enter Your Number',
          validator: (value) {
            if (value.toString().isEmpty) {
              return 'Please enter a number';
            }
            return null;
          },
          onFieldSubmitted: (value) {
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
      ],
    );
  }
}
