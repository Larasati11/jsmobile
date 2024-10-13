import 'package:flutter/material.dart';
import '../models/item.dart'; // Pastikan path ini benar

class ItemPage extends StatelessWidget {
  final Item item; // Tambahkan field item

  const ItemPage({super.key, required this.item}); // Tambahkan constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                item.imageAsset,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(
              item.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Price: \$${item.price}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 8),
            Text(
              'Stock: ${item.stock}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  'Rating: ${item.rating}',
                  style: TextStyle(fontSize: 18),
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 18,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
