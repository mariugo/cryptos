import 'package:cryptos/app/features/details/domain/entities/crypto_coin_chart.dart';

final class CryptoCoinChartModel extends CryptoCoinChartEntity {
  const CryptoCoinChartModel({
    required super.date,
    required super.price,
  });

  factory CryptoCoinChartModel.fromList(List<dynamic> list) {
    return CryptoCoinChartModel(
      date: DateTime.fromMillisecondsSinceEpoch(list[0]),
      price: list[1].toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'date': date,
        'price': price,
      };
}
