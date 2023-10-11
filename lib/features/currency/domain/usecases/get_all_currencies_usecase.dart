import 'package:crypto_statistics/core/errors/failure.dart';
import 'package:crypto_statistics/core/usecases/usecase.dart';
import 'package:crypto_statistics/features/currency/domain/entities/currency.dart';
import 'package:crypto_statistics/features/currency/domain/repositories/currency_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllCurrencies implements UseCase<List<Currency>> {
  final CurrencyRepository currencyRepository;

  const GetAllCurrencies({required this.currencyRepository});

  @override
  Future<Either<Failure, List<Currency>>> call() async {
    return await currencyRepository.getAllCurrencies();
  }
}
