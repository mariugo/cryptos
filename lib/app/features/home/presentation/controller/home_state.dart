import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:cryptos/app/features/home/data/models/cryto_coin_model.dart';

part 'home_state.g.dart';

@match
enum HomeStatus { initial, loading, success, error }

class HomeState extends Equatable {
  final HomeStatus status;
  final List<CryptoCoinModel> coins;
  final String? message;

  const HomeState({
    required this.status,
    required this.coins,
    this.message,
  });

  const HomeState.initial()
      : this(
          status: HomeStatus.initial,
          coins: const [],
        );

  HomeState copyWith({
    HomeStatus? status,
    List<CryptoCoinModel>? coins,
    String? message,
  }) {
    return HomeState(
      status: status ?? this.status,
      coins: coins ?? this.coins,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, coins, message];
}
