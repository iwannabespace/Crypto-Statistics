import 'package:crypto_statistics/features/currency/domain/entities/currency.dart';
import 'package:crypto_statistics/features/currency/domain/entities/usd_price_entity.dart';
import 'package:flutter/material.dart';
import 'package:crypto_statistics/core/util/utils.dart' as utils;
import 'package:crypto_statistics/core/router/router.dart';

class CurrencyDataWidget extends StatelessWidget {
  const CurrencyDataWidget(
      {super.key, required this.currency, required this.usdPrice});
  final Currency currency;
  final USDPrice usdPrice;

  @override
  Widget build(BuildContext context) {
    final cryptoSymbolLink =
        utils.getCryptoSymbolLink(currencySymbol: currency.symbol);
    final String currencyPrice =
        utils.getCurrencyPriceFormatted(currency: currency);
    final String tlPrice =
        utils.getPriceInTLFormatted(currency: currency, usdPrice: usdPrice);
    final (changePercent, isIncreasing) =
        utils.getChangePercent(currency: currency);

    return GestureDetector(
      onTap: () {
        router.push("/home/currency", extra: currency);
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(width: 1.5, color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 35,
                    height: 35,
                    child: Image.network(cryptoSymbolLink),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    currency.symbol,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$$currencyPrice',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '₺$tlPrice',
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 70,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(6),
                    bottomRight: Radius.circular(6),
                  ),
                  color: isIncreasing ? Colors.green : Colors.red,
                ),
                child: Center(
                  child: Text(
                    "$changePercent%",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
