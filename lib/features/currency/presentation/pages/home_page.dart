import 'package:crypto_statistics/features/currency/presentation/cubit/cubit/currency_cubit.dart';
import 'package:crypto_statistics/features/currency/presentation/cubit/cubit/currency_state.dart';
import 'package:crypto_statistics/features/currency/presentation/widgets/currency_data_widget.dart';
import 'package:crypto_statistics/features/currency/presentation/widgets/currency_price_grid_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_statistics/core/constants/constants.dart' as constants;

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CurrencyCubit, CurrencyState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CurrencyInitial) {
          return Container();
        } else if (state is CurrencyLoading) {
          return Container();
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
                        currencies: state.topCurrencies,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            child: TextField(
                              controller: controller,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                              cursorColor: Colors.orange,
                              decoration: InputDecoration(
                                hintText: "Search Crypto Currency",
                                hintStyle: const TextStyle(fontSize: 14),
                                prefixIcon: const Icon(Icons.search),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    if (controller.text.isNotEmpty) {
                                      controller.text = "";
                                      context
                                          .read<CurrencyCubit>()
                                          .filter(str: "", state: state);
                                    }
                                  },
                                  child: const Icon(Icons.cancel_outlined),
                                ),
                                prefixIconColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      states.contains(MaterialState.focused)
                                          ? Colors.orange
                                          : Colors.grey,
                                ),
                                suffixIconColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      states.contains(MaterialState.focused)
                                          ? Colors.orange
                                          : Colors.grey,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 3,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Colors.orange,
                                    width: 3,
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                context
                                    .read<CurrencyCubit>()
                                    .filter(str: value, state: state);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemCount: state.bottomCurrencies.length,
                        itemBuilder: (context, index) {
                          return CurrencyDataWidget(
                            currency: state.bottomCurrencies[index],
                            usdPrice: state.usdPrice,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 10);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Container(color: Colors.red);
        }
      },
    );
  }
}
