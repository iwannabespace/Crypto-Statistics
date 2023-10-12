import 'package:crypto_statistics/core/errors/exception.dart';
import 'package:crypto_statistics/core/errors/failure.dart';
import 'package:crypto_statistics/core/network/network_info.dart';
import 'package:crypto_statistics/features/currency/data/datasources/usd_price_local_data_source.dart';
import 'package:crypto_statistics/features/currency/data/datasources/usd_price_remote_data_source.dart';
import 'package:crypto_statistics/features/currency/domain/entities/usd_price_entity.dart';
import 'package:crypto_statistics/features/currency/domain/repositories/usd_price_repository.dart';
import 'package:dartz/dartz.dart';

class USDPriceRepositoryImpl implements USDPriceRepository {
  final USDPriceLocalDataSource usdPriceLocalDataSource;
  final USDPriceRemoteDataSource usdPriceRemoteDataSource;
  final NetworkInfo networkInfo;

  USDPriceRepositoryImpl({
    required this.usdPriceLocalDataSource,
    required this.usdPriceRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, USDPrice>> getUSDPrice() async {
    if (await networkInfo.isConnected) {
      try {
        final usdPrice = await usdPriceRemoteDataSource.getUSDPrice();
        final cached =
            await usdPriceLocalDataSource.cacheUSDPrice(usdPrice: usdPrice);

        if (!cached) {
          return Left(CacheFailure());
        } else {
          return Right(usdPrice);
        }
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final usdPrice = await usdPriceLocalDataSource.getUSDPrice();
        return Right(usdPrice);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
