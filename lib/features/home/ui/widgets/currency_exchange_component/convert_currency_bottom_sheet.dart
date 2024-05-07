import 'package:currencypro/core/utils/app_colors.dart';
import 'package:currencypro/core/utils/global.dart';
import 'package:currencypro/features/home/data/model/widgets_model/convert_currency_bottom_sheet_controller_model.dart';
import 'package:currencypro/features/home/logic/currency_exchange_cubit/currency_exchange_cubit.dart';
import 'package:currencypro/features/home/ui/widgets/currency_exchange_component/convert_currency_bottom_sheet_button.dart';
import 'package:currencypro/features/home/ui/widgets/currency_exchange_component/convert_currency_bottom_sheet_fields.dart';
import 'package:currencypro/features/home/ui/widgets/currency_exchange_component/convert_result_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/service_locator.dart';
import '../../../../../core/widgets/bottom_sheet_container.dart';

class ConvertCurrencyBottomSheet extends StatefulWidget {
  const ConvertCurrencyBottomSheet({
    super.key,
  });

  @override
  State<ConvertCurrencyBottomSheet> createState() => _ConvertCurrencyBottomSheetState();
}

class _ConvertCurrencyBottomSheetState extends State<ConvertCurrencyBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final TextEditingController convertController;
  late final TextEditingController fromController;
  late final TextEditingController toController;

  @override
  void initState() {
    super.initState();
    convertController = TextEditingController();
    fromController = TextEditingController(text: fluctuationBase);
    toController = TextEditingController(text: fluctuationBase == symbols ? 'EUR' : symbols);
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
    return BlocProvider(
      create: (context) => CurrencyExchangeCubit(sl()),
      child: SizedBox(
        height: 500,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: BlocConsumer<CurrencyExchangeCubit, CurrencyExchangeState>(
            listener: listener,
            builder: (context, state) {
              return Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Gap(15),
                        const BottomSheetContainer.centered(),
                        const Gap(15),
                        ConvertCurrencyBottomSheetFields(
                          controllerModel: ConvertBottomSheetControllerModel(
                            formKey: formKey,
                            convertController: convertController,
                            fromController: fromController,
                            toController: toController,
                          ),
                        ),
                      ],
                    ),
                    ConvertResultText(
                      currencyConversionModel:
                          (state is GetConvertCurrencySuccess) ? state.currencyConversion : null,
                    ),
                    ConvertCurrencyBottomSheetButton(
                      isLoading: state is GetConvertCurrencyLoading,
                      controllerModel: ConvertBottomSheetControllerModel(
                        formKey: formKey,
                        convertController: convertController,
                        fromController: fromController,
                        toController: toController,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void listener(context, state) {
    if (state is GetConvertCurrencyFailure) {
      context.pop();
      context.showSnackBar(
        state.failureMessage,
        snackColor: AppColors.appRedColor,
      );
    }
  }
}
