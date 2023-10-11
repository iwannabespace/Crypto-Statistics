import 'package:crypto_statistics/features/currency/presentation/cubit/cubit/currency_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CurrencyCubit, CurrencyState>(
      listener: (context, state) {
        if (state is CurrencyInitial) {
          print("Currency Initial");
        } else if (state is CurrencyLoading) {
          print("Getting the data");
        } else if (state is CurrencyLoaded) {
        } else if (state is CurrencyError) {
          print("Something went wrong");
        }
      },
      builder: (context, state) {
        if (state is CurrencyInitial) {
          return Container();
        } else if (state is CurrencyLoading) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is CurrencyLoaded) {
          return Scaffold();
        } else {
          return Container(
            color: Colors.red,
          );
        }
      },
    );
  }
}
