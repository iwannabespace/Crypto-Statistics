import 'dart:math';

import 'package:crypto_statistics/features/currency/domain/entities/currency.dart';
import 'package:flutter/material.dart';
import 'package:crypto_statistics/core/constants/constants.dart' as constants;

class CurrencyPriceWidget extends StatelessWidget {
  const CurrencyPriceWidget({required this.currency, super.key});
  final Currency currency;

  @override
  Widget build(BuildContext context) {
    final cryptoSymbolLink =
        "${constants.iconApiUrl}/${currency.symbol.toLowerCase()}";

    final price = double.parse(currency.priceUsd).toStringAsFixed(2);

    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: constants.palette[Random().nextInt(4)],
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: Image.network(cryptoSymbolLink),
              ),
              const SizedBox(height: 5),
              Text(
                currency.id.toUpperCase(),
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 7),
              Text(
                "\$$price",
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
