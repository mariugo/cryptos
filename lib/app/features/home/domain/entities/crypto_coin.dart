import 'package:equatable/equatable.dart';

abstract base class CryptoCoin extends Equatable {
  final String id;
  final String symbol;
  final String name;
  final String image;
  final num currentPrice;
  final num marketCap;
  final int marketCapRank;
  final num high24;
  final num low24;
  final num priceChange24h;
  final num priceChangePercentage24h;
  final num circulatingSupply;
  final num ath;
  final num atl;

  const CryptoCoin({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.marketCapRank,
    required this.high24,
    required this.low24,
    required this.priceChange24h,
    required this.priceChangePercentage24h,
    required this.circulatingSupply,
    required this.ath,
    required this.atl,
  });

  @override
  List<Object?> get props => [
        id,
        symbol,
        name,
        image,
        currentPrice,
        marketCap,
        marketCapRank,
        high24,
        low24,
        priceChange24h,
        priceChangePercentage24h,
        circulatingSupply,
        ath,
        atl,
      ];
}
