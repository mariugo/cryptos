import 'package:cryptos/app/features/home/data/models/cryto_coin_model.dart';
import 'package:cryptos/app/features/home/data/repository/crypto_repository_impl.dart';
import 'package:cryptos/core/network/http_adapter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final HttpAdapter httpAdapter = HttpAdapter();
  final CryptoRepositoryImpl cryptoRepositoryImpl =
      CryptoRepositoryImpl(httpAdapter: httpAdapter);

  group('getTopCoins', () {
    test('should return a list of CryptoCoinModel', () async {
      final result = await cryptoRepositoryImpl.getTopCoins();
      expect(result, isA<List<CryptoCoinModel>>());
    });

    test('should return a list of CryptoCoinModel with length 100', () async {
      final result = await cryptoRepositoryImpl.getTopCoins();
      expect(result.length, 100);
    });

    test('should return a bitcoin as first id', () async {
      final result = await cryptoRepositoryImpl.getTopCoins();
      expect(result.first.id, 'bitcoin');
    });
  });
}
