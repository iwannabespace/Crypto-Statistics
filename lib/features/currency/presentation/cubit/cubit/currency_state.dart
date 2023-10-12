part of 'currency_cubit.dart';

sealed class CurrencyState extends Equatable {
  const CurrencyState();

  @override
  List<Object> get props => [];
}

final class CurrencyInitial extends CurrencyState {}

final class CurrencyLoading extends CurrencyState {}

final class CurrencyLoaded extends CurrencyState {
  final List<Currency> currencies;
  final USDPrice usdPrice;

  const CurrencyLoaded({
    required this.currencies,
    required this.usdPrice,
  });
}

final class CurrencyError extends CurrencyState {
  final String message;

  const CurrencyError({required this.message});
}
