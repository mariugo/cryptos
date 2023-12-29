import 'package:cryptos/app/features/details/domain/usecases/get_coin_cart_usecase.dart';
import 'package:cryptos/app/features/details/presentation/controller/detail_screen_controller.dart';
import 'package:cryptos/app/features/home/domain/usecases/get_coins_usecase.dart';
import 'package:cryptos/app/features/home/presentation/controller/home_controller.dart';
import 'package:cryptos/app/features/home/presentation/screens/home_screen.dart';
import 'package:cryptos/core/di/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() {
  initDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeController>(
          create: (context) => HomeController(
            getCoinsUsecase: GetIt.I.get<GetCoinsUsecase>(),
          ),
        ),
        BlocProvider<DetailScreenController>(
          create: (context) => DetailScreenController(
            getCoinChartUsecase: GetIt.I.get<GetCoinChartUsecase>(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cryptos',
        theme: ThemeData.dark(
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
