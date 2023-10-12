import 'package:crypto_statistics/core/errors/exception.dart';
import 'package:crypto_statistics/core/errors/failure.dart';
import 'package:crypto_statistics/core/network/network_info.dart';
import 'package:crypto_statistics/features/currency/data/datasources/currency_local_data_source.dart';
import 'package:crypto_statistics/features/currency/data/datasources/currency_remote_data_source.dart';
import 'package:crypto_statistics/features/currency/domain/entities/currency.dart';
import 'package:crypto_statistics/features/currency/domain/repositories/currency_repository.dart';
import 'package:dartz/dartz.dart';

class CurrencyRepositoryImpl implements CurrencyRepository {
  final CurrencyLocalDataSource localDataSource;
  final CurrencyRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  CurrencyRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Currency>>> getAllCurrencies() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteAllCurrencies = await remoteDataSource.getAllCurrencies();
        final cached = await localDataSource.cacheAllCurrencies(
            currencies: remoteAllCurrencies);
        if (!cached) {
          return Left(CacheFailure());
        } else {
          return Right(remoteAllCurrencies);
        }
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localAllCurrencies = await localDataSource.getAllCurrencies();
        return Right(localAllCurrencies);
      } on CacheFailure {
        return Left(CacheFailure());
      }
    }
  }
}
