import 'package:crypto_statistics/core/errors/exception.dart';
import 'package:crypto_statistics/features/currency/data/models/usd_price_model.dart';
import 'package:dio/dio.dart';
import 'package:crypto_statistics/core/constants/constants.dart' as constants;

abstract class USDPriceRemoteDataSource {
  Future<USDPriceModel> getUSDPrice();
}

class USDPriceRemoteDataSourceImpl implements USDPriceRemoteDataSource {
  final Dio dio;

  const USDPriceRemoteDataSourceImpl({required this.dio});

  @override
  Future<USDPriceModel> getUSDPrice() async {
    final result = await dio.get(
      constants.usdApiUrl,
      options: Options(
        headers: {'Content-Type': 'application/json'},
      ),
    );

    if (result.statusCode == 200) {
      return USDPriceModel.fromJson(json: result.data);
    } else {
      throw ServerException();
    }
  }
}
