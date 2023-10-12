import 'package:crypto_statistics/features/currency/domain/entities/usd_price_entity.dart';

class USDPriceModel extends USDPrice {
  const USDPriceModel({required super.price});

  factory USDPriceModel.fromJson({required Map<String, dynamic> json}) {
    return USDPriceModel(price: json['USD']['satis']);
  }

  Map<String, dynamic> toJson() {
    return {
      'price': price,
    };
  }
}
