import 'package:crypto_statistics/features/currency/presentation/cubit/cubit/currency_cubit.dart';
import 'package:crypto_statistics/features/currency/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'injection_container.dart' as sl;
import 'package:crypto_statistics/core/router/router.dart' as router;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sl.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<CurrencyCubit>()..execute(),
      child: MaterialApp.router(
        routerConfig: router.router,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        ),
      ),
    );
  }
}
