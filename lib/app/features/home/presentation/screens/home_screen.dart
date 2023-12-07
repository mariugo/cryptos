import 'package:cryptos/app/features/home/presentation/controller/home_controller.dart';
import 'package:cryptos/app/features/home/presentation/controller/home_state.dart';
import 'package:cryptos/app/features/home/presentation/widgets/coin_tile.dart';
import 'package:cryptos/core/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeScreen, HomeController> {
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning! 🌅';
    }
    if (hour < 17) {
      return 'Good Afternoon! 🌇';
    }
    return 'Good Evening! 🌃';
  }

  @override
  void initState() {
    super.initState();
    controller.getCoins();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          greeting(),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: BlocConsumer<HomeController, HomeState>(
        listener: (context, state) {
          state.status.matchAny(
              any: () => hideLoader(),
              loading: () => showLoader(),
              error: () {
                hideLoader();
                showError(state.message!);
              });
        },
        buildWhen: (previous, current) => current.status.matchAny(
          any: () => false,
          initial: () => true,
          success: () => true,
        ),
        builder: (context, state) {
          return state.status == HomeStatus.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : state.status == HomeStatus.error
                  ? Center(
                      child: Text(
                        state.message!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : SafeArea(
                      child: SingleChildScrollView(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.coins.length,
                          itemBuilder: (context, index) {
                            return CoinTile(
                              imageUrl: state.coins[index].image,
                              name: state.coins[index].name,
                              price: state.coins[index].currentPrice,
                              priceChangePercentage24h:
                                  state.coins[index].priceChangePercentage24h,
                            );
                          },
                        ),
                      ),
                    );
        },
      ),
    );
  }
}
