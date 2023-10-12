import 'package:crypto_statistics/core/network/network_info.dart';
import 'package:crypto_statistics/features/currency/data/datasources/currency_local_data_source.dart';
import 'package:crypto_statistics/features/currency/data/datasources/currency_remote_data_source.dart';
import 'package:crypto_statistics/features/currency/data/datasources/usd_price_local_data_source.dart';
import 'package:crypto_statistics/features/currency/data/datasources/usd_price_remote_data_source.dart';
import 'package:crypto_statistics/features/currency/data/repositories/currency_repository_impl.dart';
import 'package:crypto_statistics/features/currency/data/repositories/usd_price_repository_impl.dart';
import 'package:crypto_statistics/features/currency/domain/repositories/currency_repository.dart';
import 'package:crypto_statistics/features/currency/domain/repositories/usd_price_repository.dart';
import 'package:crypto_statistics/features/currency/domain/usecases/get_all_currencies_usecase.dart';
import 'package:crypto_statistics/features/currency/domain/usecases/get_usd_price_usecase.dart';
import 'package:crypto_statistics/features/currency/presentation/cubit/cubit/currency_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
    () => CurrencyCubit(
      getAllCurrencies: sl(),
      getUSDPrice: sl(),
    ),
  );
  sl.registerLazySingleton(() => GetAllCurrencies(currencyRepository: sl()));
  sl.registerLazySingleton<CurrencyRepository>(
    () => CurrencyRepositoryImpl(
      localDataSource: sl(),
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<CurrencyRemoteDataSource>(
      () => CurrencyRemoteDataSourceImpl(dio: sl()));
  sl.registerLazySingleton<CurrencyLocalDataSource>(
      () => CurrencyLocalDataSourceImpl(sharedPreferences: sl()));

  sl.registerLazySingleton(() => GetUSDPrice(usdPriceRepository: sl()));
  //--
  sl.registerLazySingleton<USDPriceRepository>(
    () => USDPriceRepositoryImpl(
      usdPriceLocalDataSource: sl(),
      usdPriceRemoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<USDPriceRemoteDataSource>(
      () => USDPriceRemoteDataSourceImpl(dio: sl()));
  sl.registerLazySingleton<USDPriceLocalDataSource>(
      () => USDPriceLocalDataSourceImpl(sharedPreferences: sl()));

  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
