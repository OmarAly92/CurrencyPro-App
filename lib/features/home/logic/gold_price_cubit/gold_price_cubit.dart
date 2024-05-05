import 'package:currencypro/core/utils/global.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/gold_price_models/gold_price_model.dart';
import '../../data/model/gold_price_models/gold_price_request_parameters.dart';
import '../../data/repository/gold_price_repository.dart';

part 'gold_price_state.dart';

class GoldPriceCubit extends Cubit<GoldPriceState> {
  GoldPriceCubit(this._goldPriceRepository) : super(GoldPriceInitial());
  final GoldPriceRepository _goldPriceRepository;

  Future<void> getGoldPrice({String? metal}) async {
    emit(GetGoldPriceLoading());
    final result = await _goldPriceRepository.getGoldPrice(
        parameters: GoldPriceRequestParameters(
      metal: metal,
      countryCode: symbols,
    ));
    if (result.isSuccess) {
      emit(GetGoldPriceSuccess(goldPrice: result.value!));
    } else {
      emit(GetGoldPriceFailure(failureMessage: result.error.message));
    }
  }
}
