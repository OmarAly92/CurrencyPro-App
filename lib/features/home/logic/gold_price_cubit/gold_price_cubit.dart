import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/currency_exchange_repository.dart';

part 'gold_price_state.dart';

class GoldPriceCubit extends Cubit<GoldPriceState> {
  GoldPriceCubit(this._currencyExchangeRepository) : super(GoldPriceInitial());

  final CurrencyExchangeRepository _currencyExchangeRepository;
}
