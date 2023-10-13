import 'package:crypto_statistics/features/currency/domain/entities/currency.dart';
import 'package:crypto_statistics/features/currency/domain/entities/usd_price_entity.dart';
import 'package:equatable/equatable.dart';

sealed class CurrencyState extends Equatable {
  const CurrencyState();

  @override
  List<Object> get props => [];
}

final class CurrencyInitial extends CurrencyState {}

final class CurrencyLoading extends CurrencyState {}

final class CurrencyLoaded extends CurrencyState {
  final List<Currency> topCurrencies;
  final List<Currency> bottomCurrencies;
  late List<Currency> tCopy, bCopy;
  final USDPrice usdPrice;

  CurrencyLoaded({
    required this.topCurrencies,
    required this.bottomCurrencies,
    required this.usdPrice,
  }) {
    tCopy = bCopy = topCurrencies;
  }

  @override
  List<Object> get props => [topCurrencies, bottomCurrencies, usdPrice];
}

final class CurrencyError extends CurrencyState {
  final String message;

  const CurrencyError({required this.message});
}
