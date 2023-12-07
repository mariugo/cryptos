import 'package:cryptos/app/features/home/data/models/cryto_coin_model.dart';
import 'package:cryptos/app/features/home/domain/repository/crypto_repository.dart';

class GetCoinsUsecase {
  final CryptoRepository repository;

  const GetCoinsUsecase({
    required this.repository,
  });

  Future<List<CryptoCoinModel>> call() async {
    return await repository.getTopCoins();
  }
}
