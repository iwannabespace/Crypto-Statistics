import 'package:equatable/equatable.dart';

class Currency extends Equatable {
  final String id;
  final String rank;
  final String symbol;
  final String name;
  final String supply;
  final String? maxSupply;
  final String marketCapUsd;
  final String volumeUsd24Hr;
  final String priceUsd;
  final String changePercent24Hr;
  final String? vwap24Hr;
  final String? explorer;

  const Currency({
    required this.id,
    required this.rank,
    required this.symbol,
    required this.name,
    required this.supply,
    required this.maxSupply,
    required this.marketCapUsd,
    required this.volumeUsd24Hr,
    required this.priceUsd,
    required this.changePercent24Hr,
    required this.vwap24Hr,
    required this.explorer,
  });

  @override
  List<Object?> get props => [
        id,
        rank,
        symbol,
        name,
        supply,
        maxSupply,
        marketCapUsd,
        volumeUsd24Hr,
        priceUsd,
        changePercent24Hr,
        vwap24Hr,
        explorer,
      ];
}
