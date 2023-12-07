import 'package:flutter/material.dart';

class CoinTile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final num price;
  final num priceChangePercentage24h;

  const CoinTile({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.priceChangePercentage24h,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        child: Image.network(
          imageUrl,
          scale: 1,
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Text(
        '\$${price.toStringAsFixed(2)}',
        style: TextStyle(
          fontSize: 18,
          color: priceChangePercentage24h > 0
              ? Colors.green
              : priceChangePercentage24h < 0
                  ? Colors.red
                  : Colors.grey,
        ),
      ),
    );
  }
}
