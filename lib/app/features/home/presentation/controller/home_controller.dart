import 'package:cryptos/app/features/home/domain/usecases/get_coins_usecase.dart';
import 'package:cryptos/app/features/home/presentation/controller/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeController extends Cubit<HomeState> {
  final GetCoinsUsecase getCoinsUsecase;

  HomeController({
    required this.getCoinsUsecase,
  }) : super(const HomeState.initial());
}
