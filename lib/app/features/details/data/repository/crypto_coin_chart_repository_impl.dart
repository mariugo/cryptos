import 'dart:convert';

import 'package:cryptos/app/features/details/data/models/crypto_coin_chart_model.dart';
import 'package:cryptos/app/features/details/domain/repository/crypto_coin_chart_repository.dart';
import 'package:cryptos/core/network/http_adapter.dart';

class CryptoCoinChartRepositoryImpl implements CryptoCoinChartRepository {
  final HttpAdapter httpAdapter;

  const CryptoCoinChartRepositoryImpl({required this.httpAdapter});

  @override
  Future<List<CryptoCoinChartModel>> getCoinChart(String id, int days) async {
    try {
      Uri uri = Uri.parse(
          'https://api.coingecko.com/api/v3/coins/$id/market_chart?vs_currency=inr&days=$days');

      final response = await httpAdapter.client.get(uri);

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        List<dynamic> prices = jsonResponse['prices'];
        return prices
            .map<CryptoCoinChartModel>((e) => CryptoCoinChartModel.fromList(e))
            .toList();
      } else {
        throw Exception('Error fetching data');
      }
    } catch (e) {
      rethrow;
    }
  }
}
