import 'package:cryptos/app/features/home/domain/usecases/get_coins_usecase.dart';
import 'package:cryptos/app/features/home/presentation/controller/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeController extends Cubit<HomeState> {
  final GetCoinsUsecase getCoinsUsecase;

  HomeController({
    required this.getCoinsUsecase,
  }) : super(const HomeState.initial());

  Future<void> getCoins() async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      final coins = await getCoinsUsecase.call();
      emit(state.copyWith(status: HomeStatus.success, coins: coins));
    } catch (_) {
      emit(state.copyWith(
          status: HomeStatus.error, message: 'No data received'));
    }
  }
}
