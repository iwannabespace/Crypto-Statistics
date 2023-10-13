import 'package:crypto_statistics/features/currency/domain/entities/currency.dart';
import 'package:crypto_statistics/features/currency/domain/entities/usd_price_entity.dart';
import 'package:crypto_statistics/core/constants/constants.dart' as constants;
import 'package:flutter/material.dart';

String getCurrencyPriceFormatted({required Currency currency}) {
  final price = double.parse(currency.priceUsd);

  if (price >= 1) {
    return price.toStringAsFixed(2);
  } else {
    return price.toStringAsFixed(6);
  }
}

String getPriceInTLFormatted({
  required Currency currency,
  required USDPrice usdPrice,
}) {
  final price = double.parse(currency.priceUsd) * double.parse(usdPrice.price);

  if (price >= 1) {
    return price.toStringAsFixed(2);
  } else {
    return price.toStringAsFixed(6);
  }
}

(String, bool) getChangePercent({required Currency currency}) {
  final double asDouble = double.parse(currency.changePercent24Hr);
  final String changePercent = asDouble.toStringAsFixed(2);
  final bool isIncreasing = asDouble >= 0 ? true : false;

  return (changePercent, isIncreasing);
}

String getCryptoSymbolLink({required String currencySymbol}) {
  return "${constants.iconApiUrl}/${currencySymbol.toLowerCase()}";
}
