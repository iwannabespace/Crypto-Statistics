import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_statistics/features/currency/domain/entities/currency.dart';
import 'package:crypto_statistics/features/currency/domain/usecases/get_all_currencies_usecase.dart';
import 'package:equatable/equatable.dart';

part 'currency_state.dart';

class CurrencyCubit extends Cubit<CurrencyState> {
  final GetAllCurrencies getAllCurrencies;

  CurrencyCubit({required this.getAllCurrencies}) : super(CurrencyInitial());

  void execute() async {
    emit(CurrencyLoading());
    final result = await getAllCurrencies();

    if (result.isRight()) {
      emit(CurrencyLoaded(currencies: result.getOrElse(() => [])));
    } else {
      emit(const CurrencyError(message: "Couldn't load the currencies!"));
    }
  }
}
