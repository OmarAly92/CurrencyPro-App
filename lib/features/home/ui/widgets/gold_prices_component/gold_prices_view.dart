import 'package:currencypro/features/home/logic/gold_price_cubit/gold_price_cubit.dart';
import 'package:currencypro/features/home/ui/widgets/gold_prices_component/gold_price_success_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoldPricesView extends StatelessWidget {
  const GoldPricesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: BlocBuilder<GoldPriceCubit, GoldPriceState>(
        builder: (context, state) {
          if (state is GetGoldPriceLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetGoldPriceSuccess) {
            return GoldPriceSuccessWidget(goldPriceModel: state.goldPrice);
          } else if (state is GetGoldPriceFailure) {
            return Center(child: Text(state.failureMessage));
          } else {
            return const Center(child: Text('Unknown State'));
          }
        },
      ),
    );
  }
}
