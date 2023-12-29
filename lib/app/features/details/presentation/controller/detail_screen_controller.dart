import 'package:cryptos/app/features/details/domain/usecases/get_coin_cart_usecase.dart';
import 'package:cryptos/app/features/details/presentation/controller/detail_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class DetailScreenController extends Cubit<DetailScreenState> {
  final GetCoinChartUsecase getCoinChartUsecase;

  DetailScreenController({
    required this.getCoinChartUsecase,
  }) : super(const DetailScreenState.initial());

  Future<void> getCoinChart(String id, int day) async {
    emit(state.copyWith(status: DetailScreenStatus.loading));
    try {
      final chart = await getCoinChartUsecase.call(id: id, days: day);

      emit(
          state.copyWith(status: DetailScreenStatus.success, graphData: chart));
    } catch (_) {
      emit(state.copyWith(
          status: DetailScreenStatus.error, message: 'No data received'));
    }
  }
}
