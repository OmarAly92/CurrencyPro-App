import 'package:currencypro/core/utils/app_constants.dart';
import 'package:currencypro/core/utils/app_shared_pref.dart';
import 'package:currencypro/features/home/logic/currency_exchange_cubit/currency_exchange_cubit.dart';
import 'package:currencypro/features/home/logic/gold_price_cubit/gold_price_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/global.dart';

class ChangeCurrencyPopupMenu extends StatefulWidget {
  const ChangeCurrencyPopupMenu({
    super.key,
    required this.isConnected,
  });

  final bool isConnected;

  @override
  State<ChangeCurrencyPopupMenu> createState() => _ChangeCurrencyPopupMenuState();
}

class _ChangeCurrencyPopupMenuState extends State<ChangeCurrencyPopupMenu> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      enabled: widget.isConnected,
      tooltip: 'Change Currency',
      onSelected: (value) {
        final currencyExchangeCubit = context.read<CurrencyExchangeCubit>();
        AppSharedPref.setString(AppSharedKeys.symbol, value);
        symbols = value;
        currencyExchangeCubit.getCurrencyExchange();
        context.read<GoldPriceCubit>().getGoldPrice();
        setState(() {});
      },
      itemBuilder: (context) {
        return AppConstants.getCurrenciesCode().map((item) {
          return PopupMenuItem<String>(
            value: item,
            child: Center(
              child: Text(item),
            ),
          );
        }).toList();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 3,
          vertical: 5,
        ),
        child: Row(
          children: [
            Text(
              symbols,
              style: TextStyle(
                color: widget.isConnected ? AppColors.appBlueColor : AppColors.disableBlueColor,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 5),
            Icon(
              Icons.currency_exchange,
              color: widget.isConnected ? AppColors.appBlueColor : AppColors.disableBlueColor,
            ),
          ],
        ),
      ),
    );
  }
}
