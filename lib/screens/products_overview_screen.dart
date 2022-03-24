import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductOverviewScreen extends StatelessWidget {
  final List<Product> loadedProducts = [
    Product(
        id: 'p1',
        title: 'Red Shirt',
        description: 'A red shirt - its a preety red! ',
        price: 29.90,
        imageUrl: "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg")
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("MyShop"),
        ),
        body: GridView.builder(
          padding: EdgeInsets.all(10.0),
          itemCount: loadedProducts.length,
          itemBuilder: (BuildContext context, int index) => Container(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
        ),
      ),
    );
  }
}
