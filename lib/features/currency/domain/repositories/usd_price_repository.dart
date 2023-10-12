import 'package:crypto_statistics/core/errors/failure.dart';
import 'package:crypto_statistics/features/currency/domain/entities/usd_price_entity.dart';
import 'package:dartz/dartz.dart';

abstract class USDPriceRepository {
  Future<Either<Failure, USDPrice>> getUSDPrice();
}
