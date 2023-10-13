import 'package:cached_network_image/cached_network_image.dart';
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
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return BlocConsumer<CurrencyCubit, CurrencyState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CurrencyInitial) {
          return Container();
        } else if (state is CurrencyLoading) {
          return SafeArea(
            child: Scaffold(
              body: SizedBox(
                width: width,
                height: height,
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Image.asset("assets/crypto_owl.png"),
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 8,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                                color: Color.fromARGB(255, 0, 0, 128)),
                            SizedBox(height: 10),
                            Text("Loading Currency Datas!"),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        } else if (state is CurrencyLoaded) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                leading: IconButton(
                  onPressed: () => context.read<CurrencyCubit>().execute(),
                  icon: const Icon(
                    Icons.refresh,
                    color: Colors.black,
                  ),
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
                      child: CachedNetworkImage(
                        imageUrl: constants.jsBachUrl,
                        placeholder: (context, url) =>
                            Image.asset("assets/crypto_owl.png"),
                        errorWidget: (context, url, error) =>
                            Image.asset("assets/crypto_owl.png"),
                      ),
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
          return SafeArea(
            child: Scaffold(
              body: SizedBox(
                width: width,
                height: height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/crypto_owl.png"),
                    const SizedBox(height: 10),
                    const Text("Ooops something went wrong :("),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
