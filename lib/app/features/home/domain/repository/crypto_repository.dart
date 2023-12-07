import 'package:cryptos/app/features/home/data/models/cryto_coin_model.dart';

abstract interface class CryptoRepository {
  Future<List<CryptoCoinModel>> getTopCoins();
}
