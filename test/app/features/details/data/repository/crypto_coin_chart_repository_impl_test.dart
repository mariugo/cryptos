import 'package:cryptos/app/features/details/data/models/crypto_coin_chart_model.dart';
import 'package:cryptos/app/features/details/data/repository/crypto_coin_chart_repository_impl.dart';
import 'package:cryptos/core/network/http_adapter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final HttpAdapter httpAdapter = HttpAdapter();
  final CryptoCoinChartRepositoryImpl cryptoCoinChartRepositoryImpl =
      CryptoCoinChartRepositoryImpl(httpAdapter: httpAdapter);

  group('getCoinChart', () {
    test(
        'should return a list of CryptoCoinChartModel when the call to remote data source is successful',
        () async {
      final result =
          await cryptoCoinChartRepositoryImpl.getCoinChart('bitcoin', 1);
      expect(result, isA<List<CryptoCoinChartModel>>());
    });
  });
}
