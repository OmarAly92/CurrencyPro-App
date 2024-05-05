import 'package:equatable/equatable.dart';

class GoldPriceModel extends Equatable {
  final int timestamp;
  final String metal;
  final String currency;
  final int openTime;
  final double price;
  final double ch;
  final double priceGram24k;
  final double priceGram22k;
  final double priceGram21k;
  final double priceGram20k;
  final double priceGram18k;
  final double priceGram16k;
  final double priceGram14k;
  final double priceGram10k;

  const GoldPriceModel({
    required this.timestamp,
    required this.metal,
    required this.currency,
    required this.openTime,
    required this.price,
    required this.ch,
    required this.priceGram24k,
    required this.priceGram22k,
    required this.priceGram21k,
    required this.priceGram20k,
    required this.priceGram18k,
    required this.priceGram16k,
    required this.priceGram14k,
    required this.priceGram10k,
  });

  @override
  List<Object?> get props => [
        timestamp,
        metal,
        currency,
        openTime,
        price,
        ch,
        priceGram24k,
        priceGram22k,
        priceGram21k,
        priceGram20k,
        priceGram18k,
        priceGram16k,
        priceGram14k,
        priceGram10k,
      ];

  factory GoldPriceModel.fromJson(Map<String, dynamic> json) {
    return GoldPriceModel(
      timestamp: json['timestamp'] ?? 0,
      metal: json['metal'] ?? '',
      currency: json['currency'] ?? '',
      openTime: json['open_time'] ?? 0,
      price: json['price']?.toDouble() ?? 0.0,
      ch: json['ch']?.toDouble() ?? 0.0,
      priceGram24k: json['price_gram_24k']?.toDouble() ?? 0.0,
      priceGram22k: json['price_gram_22k']?.toDouble() ?? 0.0,
      priceGram21k: json['price_gram_21k']?.toDouble() ?? 0.0,
      priceGram20k: json['price_gram_20k']?.toDouble() ?? 0.0,
      priceGram18k: json['price_gram_18k']?.toDouble() ?? 0.0,
      priceGram16k: json['price_gram_16k']?.toDouble() ?? 0.0,
      priceGram14k: json['price_gram_14k']?.toDouble() ?? 0.0,
      priceGram10k: json['price_gram_10k']?.toDouble() ?? 0.0,
    );
  }
}
