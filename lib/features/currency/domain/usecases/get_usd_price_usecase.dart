import 'package:crypto_statistics/core/errors/failure.dart';
import 'package:crypto_statistics/core/usecases/usecase.dart';
import 'package:crypto_statistics/features/currency/domain/entities/usd_price_entity.dart';
import 'package:crypto_statistics/features/currency/domain/repositories/usd_price_repository.dart';
import 'package:dartz/dartz.dart';

class GetUSDPrice implements UseCase<USDPrice> {
  final USDPriceRepository usdPriceRepository;

  const GetUSDPrice({required this.usdPriceRepository});

  @override
  Future<Either<Failure, USDPrice>> call() async {
    return await usdPriceRepository.getUSDPrice();
  }
}
