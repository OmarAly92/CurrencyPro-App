import 'package:equatable/equatable.dart';

class GoldPricesRequestParameters extends Equatable {
  final String? metal;
  final String? countryCode;

  const GoldPricesRequestParameters({
    this.metal,
    this.countryCode,
  });

  @override
  List<Object> get props => [metal!, countryCode!];
}
