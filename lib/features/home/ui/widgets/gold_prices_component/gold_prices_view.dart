import 'package:currencypro/core/widgets/app_refresh_indicator.dart';
import 'package:currencypro/features/home/logic/gold_price_cubit/gold_price_cubit.dart';
import 'package:currencypro/features/home/ui/widgets/gold_prices_component/gold_price_success_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoldPricesView extends StatefulWidget {
  const GoldPricesView({
    super.key,
  });

  @override
  State<GoldPricesView> createState() => _GoldPricesViewState();
}

class _GoldPricesViewState extends State<GoldPricesView> {
  Future<void> refreshState() async {
    context.read<GoldPriceCubit>().getGoldPrice();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: AppRefreshIndicator(
        onRefresh: () async => await refreshState(),
        child: CustomScrollView(
          slivers: [
            BlocBuilder<GoldPriceCubit, GoldPriceState>(
              builder: (context, state) {
                if (state is GetGoldPriceLoading) {
                  return const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox.shrink(),
                        CircularProgressIndicator(),
                        SizedBox(height: 50),
                      ],
                    ),
                  );
                } else if (state is GetGoldPriceSuccess) {
                  return GoldPriceSuccessWidget(goldPriceModel: state.goldPrice);
                } else if (state is GetGoldPriceFailure) {
                  return SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox.shrink(),
                        Text(state.failureMessage),
                        const SizedBox(height: 50),
                      ],
                    ),
                  );
                } else {
                  return const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox.shrink(),
                        Text('Unknown State'),
                        SizedBox(height: 50),
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
