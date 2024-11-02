// The Products
import 'package:flutter/material.dart';

// String dartImage = "assets/W4-S1-images/dart.png";
// String firebaseImage = "assets/W4-S1-images/firebase.png";
// String flutterImage = "assets/W4-S1-images/flutter.png";

enum Product {
  Dart(
      title: "Dart",
      description: "the best object language",
      image: "assets/W4-S1-images/dart.png"),
  Flutter(
      title: "Flutter",
      description: "the best mobile widget library",
      image: "assets/W4-S1-images/flutter.png"),
  Firebase(
      title: "Firebase",
      description: "the best cloud database",
      image: "assets/W4-S1-images/firebase.png");

  final String title;
  final String description;
  final String image;

  const Product(
      {required this.title, required this.description, required this.image});
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: const Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ProductCard(product: Product.Dart),
            ProductCard(product: Product.Flutter),
            ProductCard(product: Product.Firebase),
          ],
        ),
      ),
    ),
  ));
}

class ProductCard extends StatelessWidget {
  // const ProductCard({
  //   super.key,
  // });
  final Product product;
  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Aligns items to the left
          children: [
            Image.asset(
              product.image,
              width: 80,
              height: 80,
            ),
            const SizedBox(height: 6.0),
            Text(
              product.title,
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              product.description,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
