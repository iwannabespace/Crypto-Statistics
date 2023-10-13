import 'package:crypto_statistics/core/chart/chart_datas.dart';
import 'package:crypto_statistics/core/router/router.dart';
import 'package:crypto_statistics/features/currency/domain/entities/currency.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CurrencyPage extends StatelessWidget {
  CurrencyPage({super.key, required this.currency});
  final Currency currency;

  late List<ChartData> supData;
  late List<ChartData> priData;
  late TooltipBehavior _tooltip;
  late TooltipBehavior _tooltip2;

  void setChartData() {
    _tooltip = TooltipBehavior(enable: true);
    _tooltip2 = TooltipBehavior(enable: true);
    supData = [
      ChartData(which: "Supply", amount: currency.supply),
      ChartData(which: "Max Supply", amount: currency.maxSupply ?? "0"),
    ];
    priData = [
      ChartData(which: "Price", amount: currency.priceUsd),
      ChartData(which: "VWap Avg. Price", amount: currency.vwap24Hr ?? "0"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    setChartData();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              router.pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: Text(currency.symbol),
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Supply - Max Supply Chart",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SfCircularChart(
              tooltipBehavior: _tooltip,
              series: [
                DoughnutSeries<ChartData, String>(
                  dataSource: supData,
                  xValueMapper: (data, _) => data.which,
                  yValueMapper: (data, _) => data.amount,
                  name: currency.symbol,
                  dataLabelSettings: const DataLabelSettings(
                    isVisible: true,
                  ),
                ),
              ],
              legend: const Legend(
                isVisible: true,
                overflowMode: LegendItemOverflowMode.wrap,
                position: LegendPosition.left,
              ),
            ),
            const Text(
              "Price - Vol. Average Price Chart",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SfCircularChart(
              tooltipBehavior: _tooltip2,
              series: [
                PieSeries<ChartData, String>(
                  dataSource: priData,
                  xValueMapper: (data, _) => data.which,
                  yValueMapper: (data, _) => data.amount,
                  name: currency.symbol,
                  dataLabelSettings: const DataLabelSettings(
                    isVisible: true,
                  ),
                ),
              ],
              legend: const Legend(
                isVisible: true,
                overflowMode: LegendItemOverflowMode.wrap,
                position: LegendPosition.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
