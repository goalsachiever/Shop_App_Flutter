import 'package:flutter/cupertino.dart';
import 'product.dart';
class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
        id: 'p1',
        title: 'Red Shirt',
        description: 'A red shirt - its a preety red! ',
        price: 29.90,
        imageUrl:
        "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
    Product(
        id: 'p2',
        title: 'Green Shirt',
        description: 'A red shirt - its a preety red! ',
        price: 29.90,
        imageUrl:
        "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
    Product(
        id: 'p3',
        title: 'Yello Shirt',
        description: 'A red shirt - its a preety red! ',
        price: 29.90,
        imageUrl:
        "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
    Product(
        id: 'p1',
        title: 'Blue Shirt',
        description: 'A red shirt - its a preety red! ',
        price: 29.90,
        imageUrl:
        "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
    Product(
        id: 'p1',
        title: 'Orange Shirt',
        description: 'A red shirt - its a preety red! ',
        price: 29.90,
        imageUrl:
        "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
    Product(
        id: 'p1',
        title: 'Orange Shirt',
        description: 'A red shirt - its a preety red! ',
        price: 29.90,
        imageUrl:
        "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
    Product(
        id: 'p1',
        title: 'Orange Shirt',
        description: 'A red shirt - its a preety red! ',
        price: 29.90,
        imageUrl:
        "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
    Product(
        id: 'p1',
        title: 'Orange Shirt',
        description: 'A red shirt - its a preety red! ',
        price: 29.90,
        imageUrl:
        "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
    Product(
        id: 'p1',
        title: 'Orange Shirt',
        description: 'A red shirt - its a preety red! ',
        price: 29.90,
        imageUrl:
        "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
    Product(
        id: 'p1',
        title: 'Orange Shirt',
        description: 'A red shirt - its a preety red! ',
        price: 29.90,
        imageUrl:
        "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
    Product(
        id: 'p1',
        title: 'Orange Shirt',
        description: 'A red shirt - its a preety red! ',
        price: 29.90,
        imageUrl:
        "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
    Product(
        id: 'p1',
        title: 'Orange Shirt',
        description: 'A red shirt - its a preety red! ',
        price: 29.90,
        imageUrl:
        "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
    Product(
        id: 'p1',
        title: 'Orange Shirt',
        description: 'A red shirt - its a preety red! ',
        price: 29.90,
        imageUrl:
        "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
    Product(
        id: 'p1',
        title: 'Orange Shirt',
        description: 'A red shirt - its a preety red! ',
        price: 29.90,
        imageUrl:
        "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
    Product(
        id: 'p1',
        title: 'Orange Shirt',
        description: 'A red shirt - its a preety red! ',
        price: 29.90,
        imageUrl:
        "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
    Product(
        id: 'p1',
        title: 'Orange Shirt',
        description: 'A red shirt - its a preety red! ',
        price: 29.90,
        imageUrl:
        "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
  ];

  var _showFavoritesOnly = false;

  List<Product> get items {
    // if(_showFavoritesOnly)
    //   {
    //     return _items.where((prodItem) => prodItem.isFavorite).toList();
    //   }
    return [..._items];
  }

  List <Product> get favoriteItems
  {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id)
  {
    return _items.firstWhere((prod) => prod.id == id);
  }
  //
  // void showFavoriteOnly()
  // {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  //
  // }
  //
  // void showAll()
  // {
  //   _showFavoritesOnly =  false;
  //   notifyListeners();
  // }

  void addProduct(){
    // _items.add(value);
    notifyListeners();
  }
}