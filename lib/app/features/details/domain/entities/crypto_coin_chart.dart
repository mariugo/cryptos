import 'package:equatable/equatable.dart';

abstract base class CryptoCoinChartEntity extends Equatable {
  final DateTime? date;
  final double? price;

  const CryptoCoinChartEntity({
    this.date,
    this.price,
  });

  @override
  List<Object?> get props => [date, price];
}
