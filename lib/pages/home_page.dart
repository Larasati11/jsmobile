import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/item.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(name: 'Sugar', price: 5000, imageAsset: 'assets/images/sugar.jpeg', stock: 100, rating: 4.5),
    Item(name: 'Salt', price: 2000, imageAsset: 'assets/images/salt.jpeg', stock: 50, rating: 4.0),
    Item(name: 'Rice', price: 10000, imageAsset: 'assets/images/sugar.jpeg', stock: 200, rating: 4.8),
    Item(name: 'Milk', price: 15000, imageAsset: 'assets/images/salt.jpeg', stock: 75, rating: 4.7),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.7,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return InkWell(
              onTap: () {
                // Print nama item yang ditekan
                print("Item tapped: ${item.name}");
                context.go('/item', extra: item); // Navigasi dengan go_router
              },
              child: Card(
                elevation: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Image.asset(
                        item.imageAsset,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text('Price: \$${item.price}'),
                          Text('Stock: ${item.stock}'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Rating: ${item.rating}'),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 16,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
