class ChartData {
  ChartData({required this.which, required String amount}) {
    this.amount = double.parse(double.parse(amount).toStringAsFixed(2));
  }

  final String which;
  late double amount;
}
