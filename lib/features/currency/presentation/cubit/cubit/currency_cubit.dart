import 'package:crypto_statistics/features/currency/domain/entities/usd_price_entity.dart';
import 'package:crypto_statistics/features/currency/domain/usecases/get_usd_price_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_statistics/features/currency/domain/entities/currency.dart';
import 'package:crypto_statistics/features/currency/domain/usecases/get_all_currencies_usecase.dart';
import 'package:equatable/equatable.dart';

part 'currency_state.dart';

class CurrencyCubit extends Cubit<CurrencyState> {
  final GetAllCurrencies getAllCurrencies;
  final GetUSDPrice getUSDPrice;

  CurrencyCubit({
    required this.getAllCurrencies,
    required this.getUSDPrice,
  }) : super(CurrencyInitial());

  void execute() async {
    emit(CurrencyLoading());
    final currencyResult = await getAllCurrencies();
    final usdPriceResult = await getUSDPrice();

    if (currencyResult.isRight() && usdPriceResult.isRight()) {
      emit(
        CurrencyLoaded(
          currencies: currencyResult.getOrElse(() => []),
          usdPrice: usdPriceResult.getOrElse(
            () => const USDPrice(price: ""),
          ),
        ),
      );
    } else {
      emit(
        const CurrencyError(
            message: "Couldn't load the currencies or USD price!"),
      );
    }
  }
}
