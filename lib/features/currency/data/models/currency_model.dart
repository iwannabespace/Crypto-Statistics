import 'package:crypto_statistics/features/currency/domain/entities/currency.dart';

class CurrencyModel extends Currency {
  const CurrencyModel({
    required super.id,
    required super.rank,
    required super.symbol,
    required super.name,
    required super.supply,
    required super.maxSupply,
    required super.marketCapUsd,
    required super.volumeUsd24Hr,
    required super.priceUsd,
    required super.changePercent24Hr,
    required super.vwap24Hr,
    required super.explorer,
  });

  factory CurrencyModel.fromJson({required Map<String, dynamic> json}) {
    return CurrencyModel(
      id: json['id'],
      rank: json['rank'],
      symbol: json['symbol'],
      name: json['name'],
      supply: json['supply'],
      maxSupply: json['maxSupply'],
      marketCapUsd: json['marketCapUsd'],
      volumeUsd24Hr: json['volumeUsd24Hr'],
      priceUsd: json['priceUsd'],
      changePercent24Hr: json['changePercent24Hr'],
      vwap24Hr: json['vwap24Hr'],
      explorer: json['explorer'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'rank': rank,
      'symbol': symbol,
      'name': name,
      'supply': supply,
      'maxSupply': maxSupply,
      'marketCapUsd': marketCapUsd,
      'volumeUsd24Hr': volumeUsd24Hr,
      'priceUsd': priceUsd,
      'changePercent24Hr': changePercent24Hr,
      'vwap24Hr': vwap24Hr,
      'explorer': explorer,
    };
  }
}
