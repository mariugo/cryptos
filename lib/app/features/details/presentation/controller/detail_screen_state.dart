import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:cryptos/app/features/details/data/models/crypto_coin_chart_model.dart';

part 'detail_screen_state.g.dart';

@match
enum DetailScreenStatus { initial, loading, success, error }

final class DetailScreenState extends Equatable {
  final DetailScreenStatus status;
  final List<CryptoCoinChartModel> graphData;
  final String? message;

  const DetailScreenState({
    required this.status,
    required this.graphData,
    this.message,
  });

  const DetailScreenState.initial()
      : this(
          status: DetailScreenStatus.initial,
          graphData: const [],
        );

  DetailScreenState copyWith({
    DetailScreenStatus? status,
    List<CryptoCoinChartModel>? graphData,
    String? message,
  }) {
    return DetailScreenState(
      status: status ?? this.status,
      graphData: graphData ?? this.graphData,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, graphData, message];
}
