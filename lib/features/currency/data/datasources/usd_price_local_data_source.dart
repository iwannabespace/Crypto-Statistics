import 'dart:convert';

import 'package:crypto_statistics/core/errors/exception.dart';
import 'package:crypto_statistics/features/currency/data/models/usd_price_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class USDPriceLocalDataSource {
  Future<USDPriceModel> getUSDPrice();
  Future<bool> cacheUSDPrice({required USDPriceModel usdPrice});
}

const cacheStringUSD = 'usdPrice';

class USDPriceLocalDataSourceImpl implements USDPriceLocalDataSource {
  final SharedPreferences sharedPreferences;

  USDPriceLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<USDPriceModel> getUSDPrice() {
    final jsonString = sharedPreferences.getString(cacheStringUSD);

    if (jsonString != null) {
      return Future.value(
          USDPriceModel.fromJson(json: json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<bool> cacheUSDPrice({required USDPriceModel usdPrice}) async {
    return await sharedPreferences.setString(
        cacheStringUSD, json.encode(usdPrice.toJson()));
  }
}
