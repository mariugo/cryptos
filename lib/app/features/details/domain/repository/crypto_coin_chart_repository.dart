import 'package:cryptos/app/features/details/data/models/crypto_coin_chart_model.dart';

abstract interface class CryptoCoinChartRepository {
  Future<List<CryptoCoinChartModel>> getCoinChart(String id, int days);
}
