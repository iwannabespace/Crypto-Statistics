import 'dart:convert';

import 'package:crypto_statistics/core/errors/exception.dart';
import 'package:crypto_statistics/features/currency/data/models/currency_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CurrencyLocalDataSource {
  Future<List<CurrencyModel>> getAllCurrencies();
  Future<bool> cacheAllCurrencies({required List<CurrencyModel> currencies});
}

const cacheStringCurrency = 'allCurrencies';

class CurrencyLocalDataSourceImpl implements CurrencyLocalDataSource {
  final SharedPreferences sharedPreferences;

  const CurrencyLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<CurrencyModel>> getAllCurrencies() async {
    final jsonString = sharedPreferences.getString(cacheStringCurrency);

    if (jsonString != null) {
      return (json.decode(jsonString) as List)
          .map((e) => CurrencyModel.fromJson(json: e))
          .toList();
    } else {
      throw CacheException();
    }
  }

  @override
  Future<bool> cacheAllCurrencies({
    required List<CurrencyModel> currencies,
  }) async {
    final joined =
        currencies.map((e) => json.encode(e.toJson())).toList().join(',');
    final result = '[$joined]';

    return await sharedPreferences.setString(cacheStringCurrency, result);
  }
}
