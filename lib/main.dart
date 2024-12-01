import 'package:flutter/material.dart';
import 'dataHolder/inMemoryDataBase.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clotes Shop',
      home:  MyHomePage(),
    );
  }
}

  class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Clotes Shop'),
          centerTitle: true,
          surfaceTintColor: Colors.cyanAccent
      ),
      body: ListView.builder(
        itemCount: InMemoryDatabase.items.length,
        itemBuilder: (context, index) {
          final item = InMemoryDatabase.items[index];
          return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(productId: item.id),
                  ),
                );
              },
              child: Card(
                margin: const EdgeInsets.all(8),
                elevation: 4,
                child: Container(
                  height: 170,
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 120,
                        child: Image(
                          image: AssetImage(item.image),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              item.description,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '\$${item.price.toStringAsFixed(2)}',
                        style: const TextStyle(color: Colors.green, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              )
          );
        },
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final int productId;

  const DetailsPage({super.key, required this.productId});


  @override
  Widget build(BuildContext context) {
    // Get item by id via InMemoryDatabase
    final item = InMemoryDatabase.items.firstWhere((item) => item.id == productId);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Product'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Image(
                    image: AssetImage(item.image),
                  ),
                ),
                const SizedBox(height: 16),
                // Item Name
                Text(
                  item.name,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                // Item Price
                Text(
                  'Price: \$${item.price.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 20, color: Colors.green),
                ),
                const SizedBox(height: 16),
                // Item Description
                const Text(
                  'Description',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  item.description,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        )
    );
  }
}
