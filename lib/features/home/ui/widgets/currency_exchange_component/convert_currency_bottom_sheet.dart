import 'package:currencypro/core/utils/global.dart';
import 'package:currencypro/features/home/ui/widgets/currency_exchange_component/convert_currency_bottom_sheet_button.dart';
import 'package:currencypro/features/home/ui/widgets/currency_exchange_component/convert_currency_bottom_sheet_fields.dart';
import 'package:currencypro/features/home/ui/widgets/currency_exchange_component/convert_result_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConvertCurrencyBottomSheet extends StatefulWidget {
  const ConvertCurrencyBottomSheet({
    super.key,
  });

  @override
  State<ConvertCurrencyBottomSheet> createState() => _ConvertCurrencyBottomSheetState();
}

class _ConvertCurrencyBottomSheetState extends State<ConvertCurrencyBottomSheet> {
  late final TextEditingController convertController;
  late final TextEditingController fromController;
  late final TextEditingController toController;

  @override
  void initState() {
    super.initState();
    convertController = TextEditingController();
    fromController = TextEditingController(text: fluctuationBase);
    toController = TextEditingController(text: symbols);
  }

  @override
  void dispose() {
    super.dispose();
    convertController.dispose();
    fromController.dispose();
    toController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ConvertCurrencyBottomSheetFields(
              convertController: convertController,
              fromController: fromController,
              toController: toController,
            ),
            const ConvertResultText(),
            const ConvertCurrencyBottomSheetButton(),
          ],
        ),
      ),
    );
  }
}
