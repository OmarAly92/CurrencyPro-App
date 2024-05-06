import 'package:currencypro/core/utils/global.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/gold_price_models/gold_price_model.dart';
import '../../data/model/gold_price_models/gold_price_request_parameters.dart';
import '../../data/repository/gold_prices_repository.dart';

part 'gold_prices_state.dart';

class GoldPricesCubit extends Cubit<GoldPricesState> {
  GoldPricesCubit(this._goldPriceRepository) : super(GoldPricesInitial());
  final GoldPricesRepository _goldPriceRepository;

  Future<void> getGoldPrice({String? metal}) async {
    emit(GetGoldPricesLoading());
    final result = await _goldPriceRepository.getGoldPrice(
        parameters: GoldPricesRequestParameters(
      metal: metal,
      countryCode: symbols,
    ));
    if (result.isSuccess) {
      emit(GetGoldPricesSuccess(goldPrice: result.value!));
    } else {
      emit(GetGoldPricesFailure(failureMessage: result.error.message));
    }
  }
}
