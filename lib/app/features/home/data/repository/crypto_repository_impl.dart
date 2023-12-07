import 'dart:convert';

import 'package:cryptos/app/features/home/data/models/cryto_coin_model.dart';
import 'package:cryptos/app/features/home/domain/repository/crypto_repository.dart';
import 'package:cryptos/core/constants/api_constants.dart';
import 'package:cryptos/core/network/http_adapter.dart';

class CryptoRepositoryImpl implements CryptoRepository {
  final HttpAdapter httpAdapter;

  CryptoRepositoryImpl({required this.httpAdapter});

  @override
  Future<List<CryptoCoinModel>> getTopCoins() async {
    try {
      final response = await httpAdapter.client.get(
        Uri.parse(getMarketDataUrl),
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse
            .map<CryptoCoinModel>((e) => CryptoCoinModel.fromJson(e))
            .toList();
      } else {
        throw Exception('Error fetching data');
      }
    } on Exception catch (_) {
      rethrow;
    }
  }
}
