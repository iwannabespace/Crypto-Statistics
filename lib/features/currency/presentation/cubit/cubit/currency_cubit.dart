import 'package:crypto_statistics/features/currency/domain/entities/usd_price_entity.dart';
import 'package:crypto_statistics/features/currency/domain/usecases/get_usd_price_usecase.dart';
import 'package:crypto_statistics/features/currency/presentation/cubit/cubit/currency_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_statistics/features/currency/domain/usecases/get_all_currencies_usecase.dart';

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
      final currencies = currencyResult.getOrElse(() => []);
      emit(
        CurrencyLoaded(
          topCurrencies: currencies,
          bottomCurrencies: currencies,
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

  void filter({required String str, required CurrencyLoaded state}) {
    if (str.isEmpty) {
      emit(CurrencyLoaded(
          topCurrencies: state.topCurrencies,
          bottomCurrencies: state.bottomCurrencies,
          usdPrice: state.usdPrice));
    }
    var filtered = state.bCopy;
    filtered = filtered
        .where((element) => element.symbol.toLowerCase().contains(str))
        .toList();
    emit(
      CurrencyLoaded(
        topCurrencies: state.topCurrencies,
        bottomCurrencies: filtered,
        usdPrice: state.usdPrice,
      ),
    );
  }
}
