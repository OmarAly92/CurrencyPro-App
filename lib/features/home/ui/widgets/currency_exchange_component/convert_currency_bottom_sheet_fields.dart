import 'package:currencypro/features/home/ui/widgets/currency_exchange_component/enter_your_number_field.dart';
import 'package:currencypro/features/home/ui/widgets/currency_exchange_component/from_to_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../data/model/widgets_model/convert_currency_bottom_sheet_controller_model.dart';

class ConvertCurrencyBottomSheetFields extends StatelessWidget {
  const ConvertCurrencyBottomSheetFields({
    super.key,
    required this.controllerModel,
  });

  final ConvertBottomSheetControllerModel controllerModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EnterYourNumberField(controllerModel: controllerModel),
        const Gap(15),
        FromToFields(
          fromController: controllerModel.fromController,
          toController: controllerModel.toController,
        ),
      ],
    );
  }
}
