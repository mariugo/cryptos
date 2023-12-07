import 'package:cryptos/app/features/home/data/repository/crypto_repository_impl.dart';
import 'package:cryptos/app/features/home/domain/repository/crypto_repository.dart';
import 'package:cryptos/app/features/home/domain/usecases/get_coins_usecase.dart';
import 'package:cryptos/app/features/home/presentation/controller/home_controller.dart';
import 'package:cryptos/core/network/http_adapter.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void initDI() {
  _registerRepositories();
  _registerUseCases();
  _registerControllers();
}

void _registerRepositories() {
  sl.registerLazySingleton<CryptoRepository>(
    () => CryptoRepositoryImpl(httpAdapter: HttpAdapter()),
  );
}

void _registerUseCases() {
  sl.registerLazySingleton(() => GetCoinsUsecase(
        repository: sl<CryptoRepository>(),
      ));
}

void _registerControllers() {
  sl.registerLazySingleton(() => HomeController(
        getCoinsUsecase: sl<GetCoinsUsecase>(),
      ));
}
