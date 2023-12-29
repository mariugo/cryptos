import 'package:cryptos/app/features/home/data/models/cryto_coin_model.dart';
import 'package:cryptos/app/features/home/domain/repository/crypto_repository.dart';

final class GetCoinsUsecase {
  final CryptoRepository repository;

  const GetCoinsUsecase({
    required this.repository,
  });

  Future<List<CryptoCoinModel>> call() async => await repository.getTopCoins();
}
