import 'package:cryptos/app/features/home/domain/entities/crypto_coin.dart';

final class CryptoCoinModel extends CryptoCoin {
  const CryptoCoinModel({
    required super.id,
    required super.symbol,
    required super.name,
    required super.image,
    required super.currentPrice,
    required super.marketCap,
    required super.marketCapRank,
    required super.high24,
    required super.low24,
    required super.priceChange24h,
    required super.priceChangePercentage24h,
    required super.circulatingSupply,
    required super.ath,
    required super.atl,
  });

  factory CryptoCoinModel.fromJson(Map<String, dynamic> json) =>
      CryptoCoinModel(
        id: json['id'],
        symbol: json['symbol'],
        name: json['name'],
        image: json['image'],
        currentPrice: json['current_price'],
        marketCap: json['market_cap'],
        marketCapRank: json['market_cap_rank'],
        high24: json['high_24h'],
        low24: json['low_24h'],
        priceChange24h: json['price_change_24h'],
        priceChangePercentage24h: json['price_change_percentage_24h'],
        circulatingSupply: json['circulating_supply'],
        ath: json['ath'],
        atl: json['atl'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'symbol': symbol,
        'name': name,
        'image': image,
        'current_price': currentPrice,
        'market_cap': marketCap,
        'market_cap_rank': marketCapRank,
        'high_24h': high24,
        'low_24h': low24,
        'price_change_24h': priceChange24h,
        'price_change_percentage_24h': priceChangePercentage24h,
        'circulating_supply': circulatingSupply,
        'ath': ath,
        'atl': atl,
      };
}
