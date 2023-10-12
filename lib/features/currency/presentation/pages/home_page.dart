import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:crypto_statistics/features/currency/domain/entities/currency.dart';
import 'package:crypto_statistics/features/currency/presentation/cubit/cubit/currency_cubit.dart';
import 'package:crypto_statistics/features/currency/presentation/widgets/currency_data_widget.dart';
import 'package:crypto_statistics/features/currency/presentation/widgets/currency_price_grid_widget.dart';
import 'package:crypto_statistics/features/currency/presentation/widgets/currency_price_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_statistics/core/constants/constants.dart' as constants;
import 'package:google_fonts/google_fonts.dart';

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
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is CurrencyLoaded) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                leading: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                title: const Text(
                  "HOME",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                actions: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 4, bottom: 4, right: 16),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(constants.jsBachUrl),
                    ),
                  ),
                ],
                centerTitle: false,
                elevation: 0.0,
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CurrencyGridWidget(
                        currencies: state.currencies,
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemCount: 100,
                        itemBuilder: (context, index) {
                          return CurrencyDataWidget(
                            currency: state.currencies[index],
                            usdPrice: state.usdPrice,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 10);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        } else {
          return Container(
            color: Colors.red,
          );
        }
      },
    );
  }
}
