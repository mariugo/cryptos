import 'package:cryptos/app/features/details/data/models/crypto_coin_chart_model.dart';
import 'package:cryptos/app/features/details/domain/repository/crypto_coin_chart_repository.dart';

final class GetCoinChartUsecase {
  final CryptoCoinChartRepository repository;

  const GetCoinChartUsecase({
    required this.repository,
  });

  Future<List<CryptoCoinChartModel>> call({
    required String id,
    required int days,
  }) async =>
      await repository.getCoinChart(id, days);
}
