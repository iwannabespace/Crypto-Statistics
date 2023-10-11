import 'package:crypto_statistics/core/errors/failure.dart';
import 'package:crypto_statistics/features/currency/domain/entities/currency.dart';
import 'package:dartz/dartz.dart';

abstract class CurrencyRepository {
  Future<Either<Failure, List<Currency>>> getAllCurrencies();
}
