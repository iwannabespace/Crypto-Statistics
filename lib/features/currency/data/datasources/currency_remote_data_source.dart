import 'package:crypto_statistics/core/errors/exception.dart';
import 'package:crypto_statistics/features/currency/data/models/currency_model.dart';
import 'package:dio/dio.dart';
import 'package:crypto_statistics/core/constants/constants.dart' as constants;

abstract class CurrencyRemoteDataSource {
  Future<List<CurrencyModel>> getAllCurrencies();
}

class CurrencyRemoteDataSourceImpl implements CurrencyRemoteDataSource {
  final Dio dio;

  const CurrencyRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<CurrencyModel>> getAllCurrencies() async {
    final response = await dio.get(
      constants.apiUrl,
      options: Options(headers: {'Content-Type': 'application/json'}),
    );

    if (response.statusCode == 200) {
      final data = response.data['data'] as List;
      return data.map((e) => CurrencyModel.fromJson(json: e)).toList();
    } else {
      throw ServerException();
    }
  }
}
