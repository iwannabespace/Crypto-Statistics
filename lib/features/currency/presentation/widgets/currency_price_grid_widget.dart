import 'package:crypto_statistics/features/currency/domain/entities/currency.dart';
import 'package:crypto_statistics/features/currency/presentation/widgets/currency_price_widget.dart';
import 'package:flutter/material.dart';

class CurrencyGridWidget extends StatelessWidget {
  const CurrencyGridWidget({super.key, required this.currencies});
  final List<Currency> currencies;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child:
                      CurrencyPriceWidget(currency: currencies[0], index: 0)),
              const SizedBox(width: 12),
              Expanded(
                  child:
                      CurrencyPriceWidget(currency: currencies[1], index: 1)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                  child:
                      CurrencyPriceWidget(currency: currencies[2], index: 2)),
              const SizedBox(width: 12),
              Expanded(
                  child:
                      CurrencyPriceWidget(currency: currencies[3], index: 3)),
            ],
          ),
        ],
      ),
    );
  }
}
