import 'package:currencypro/core/widgets/app_error_widget.dart';
import 'package:currencypro/features/home/ui/widgets/currency_exchange_component/currency_exchange_loading_shimmer.dart';
import 'package:currencypro/features/home/ui/widgets/currency_exchange_component/currency_exchange_success_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/app_refresh_indicator.dart';
import '../../../logic/currency_exchange_cubit/currency_exchange_cubit.dart';

class CurrencyExchangeBody extends StatefulWidget {
  const CurrencyExchangeBody({
    super.key,
  });

  @override
  State<CurrencyExchangeBody> createState() => _CurrencyExchangeBodyState();
}

class _CurrencyExchangeBodyState extends State<CurrencyExchangeBody> {
  Future<void> refreshState() async {
    context.read<CurrencyExchangeCubit>().getCurrencyExchange();
  }

  @override
  Widget build(BuildContext context) {
    return AppRefreshIndicator(
      onRefresh: () async => await refreshState(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: CustomScrollView(
          slivers: [
            BlocBuilder<CurrencyExchangeCubit, CurrencyExchangeState>(
              builder: (context, state) {
                if (state is GetCurrencyExchangeLoading) {
                  return const SliverToBoxAdapter(child: CurrencyExchangeLoadingShimmer());
                } else if (state is GetCurrencyExchangeSuccess) {
                  return CurrencyExchangeSuccessWidget(state: state);
                } else if (state is GetCurrencyExchangeFailure) {
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
