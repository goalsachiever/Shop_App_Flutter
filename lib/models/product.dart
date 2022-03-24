import 'dart:ffi';

class Product {
  late final String id;
  late final String title;
  late final String description;
  late final double price;
  late final String imageUrl;
  late bool isFavorite;


  Product({required this.id,required this.title,required this.description,required this.imageUrl,required this.price, this.isFavorite});
}