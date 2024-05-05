import 'package:currencypro/core/widgets/bottom_sheet_container.dart';
import 'package:currencypro/features/home/ui/widgets/currency_exchange_component/enter_your_number_field.dart';
import 'package:currencypro/features/home/ui/widgets/currency_exchange_component/from_to_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ConvertCurrencyBottomSheetFields extends StatelessWidget {
  const ConvertCurrencyBottomSheetFields({
    super.key,
    required this.convertController,
    required this.fromController,
    required this.toController,
  });

  final TextEditingController convertController;
  final TextEditingController fromController;
  final TextEditingController toController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(15),
        const BottomSheetContainer.centered(),
        const Gap(15),
        EnterYourNumberField(convertController: convertController),
        const Gap(15),
        FromToFields(fromController: fromController, toController: toController),
      ],
    );
  }
}
