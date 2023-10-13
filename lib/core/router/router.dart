import 'package:crypto_statistics/features/currency/domain/entities/currency.dart';
import 'package:crypto_statistics/features/currency/presentation/pages/currency_page.dart';
import 'package:crypto_statistics/features/currency/presentation/pages/home_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: "/home",
  routes: [
    GoRoute(
      path: "/home",
      builder: (context, state) => HomePage(),
      routes: [
        GoRoute(
          path: "currency",
          builder: (context, state) {
            final currency = state.extra as Currency;
            return CurrencyPage(currency: currency);
          },
        ),
      ],
    ),
  ],
);
