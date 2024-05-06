import 'package:currencypro/core/widgets/app_error_widget.dart';
import 'package:currencypro/core/widgets/app_refresh_indicator.dart';
import 'package:currencypro/features/home/logic/gold_price_cubit/gold_price_cubit.dart';
import 'package:currencypro/features/home/ui/widgets/gold_prices_component/get_gold_price_loading_shimmer.dart';
import 'package:currencypro/features/home/ui/widgets/gold_prices_component/gold_price_success_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoldPricesBody extends StatefulWidget {
  const GoldPricesBody({
    super.key,
  });

  @override
  State<GoldPricesBody> createState() => _GoldPricesBodyState();
}

class _GoldPricesBodyState extends State<GoldPricesBody> {
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
                  return const SliverToBoxAdapter(
                    child: GetGoldPriceLoadingShimmer(),
                  );
                } else if (state is GetGoldPriceSuccess) {
                  return GoldPriceSuccessWidget(goldPriceModel: state.goldPrice);
                } else if (state is GetGoldPriceFailure) {
                  return SliverFillRemaining(
                    hasScrollBody: false,
                    child: AppErrorWidget(
                      failureMsg: state.failureMessage,
                      onPressed: refreshState,
                    ),
                  );
                } else {
                  return SliverFillRemaining(
                    hasScrollBody: false,
                    child: AppErrorWidget(
                      failureMsg: 'Unknown State',
                      onPressed: refreshState,
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
