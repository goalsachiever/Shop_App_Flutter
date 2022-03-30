import 'package:flutter/cupertino.dart';
import 'product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Products with ChangeNotifier {
  List<Product> _items = [
    // Product(
    //     id: 'p1',
    //     title: 'Red Shirt',
    //     description: 'A red shirt - its a preety red! ',
    //     price: 29.90,
    //     imageUrl:
    //         "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
    // Product(
    //     id: 'p2',
    //     title: 'Green Shirt',
    //     description: 'A red shirt - its a preety red! ',
    //     price: 29.90,
    //     imageUrl:
    //         "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
    // Product(
    //     id: 'p3',
    //     title: 'Yello Shirt',
    //     description: 'A red shirt - its a preety red! ',
    //     price: 29.90,
    //     imageUrl:
    //         "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
    // Product(
    //     id: 'p4',
    //     title: 'Blue Shirt',
    //     description: 'A red shirt - its a preety red! ',
    //     price: 29.90,
    //     imageUrl:
    //         "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
    // Product(
    //     id: 'p5',
    //     title: 'Orange Shirt',
    //     description: 'A red shirt - its a preety red! ',
    //     price: 29.90,
    //     imageUrl:
    //         "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
    // Product(
    //     id: 'p6',
    //     title: 'Orange Shirt',
    //     description: 'A red shirt - its a preety red! ',
    //     price: 29.90,
    //     imageUrl:
    //         "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
    // Product(
    //     id: 'p7',
    //     title: 'Orange Shirt',
    //     description: 'A red shirt - its a preety red! ',
    //     price: 29.90,
    //     imageUrl:
    //         "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
    // Product(
    //     id: 'p8',
    //     title: 'Orange Shirt',
    //     description: 'A red shirt - its a preety red! ',
    //     price: 29.90,
    //     imageUrl:
    //         "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
    // Product(
    //     id: 'p9',
    //     title: 'Orange Shirt',
    //     description: 'A red shirt - its a preety red! ',
    //     price: 29.90,
    //     imageUrl:
    //         "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
    // Product(
    //     id: 'p10',
    //     title: 'Orange Shirt',
    //     description: 'A red shirt - its a preety red! ',
    //     price: 29.90,
    //     imageUrl:
    //         "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
    // Product(
    //     id: 'p11',
    //     title: 'Orange Shirt',
    //     description: 'A red shirt - its a preety red! ',
    //     price: 29.90,
    //     imageUrl:
    //         "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
    // Product(
    //     id: 'p13',
    //     title: 'Orange Shirt',
    //     description: 'A red shirt - its a preety red! ',
    //     price: 29.90,
    //     imageUrl:
    //         "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
    // Product(
    //     id: 'p14',
    //     title: 'Orange Shirt',
    //     description: 'A red shirt - its a preety red! ',
    //     price: 29.90,
    //     imageUrl:
    //         "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
    // Product(
    //     id: 'p15',
    //     title: 'Orange Shirt',
    //     description: 'A red shirt - its a preety red! ',
    //     price: 29.90,
    //     imageUrl:
    //         "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
    // Product(
    //     id: 'p16',
    //     title: 'Orange Shirt',
    //     description: 'A red shirt - its a preety red! ',
    //     price: 29.90,
    //     imageUrl:
    //         "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
    // Product(
    //     id: 'p17',
    //     title: 'Orange Shirt',
    //     description: 'A red shirt - its a preety red! ',
    //     price: 29.90,
    //     imageUrl:
    //         "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
  ];

  var _showFavoritesOnly = false;

  List<Product> get items {
    // if(_showFavoritesOnly)
    //   {
    //     return _items.where((prodItem) => prodItem.isFavorite).toList();
    //   }
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
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

  Future<void> fetchAndSetProduct() async {
    const url =
        'https://shop-app-39430-default-rtdb.firebaseio.com/products.json';
    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      // print(json.decode(response.body));
      final List<Product> loadedProducts = [];
      extractedData.forEach((prodId, prodData) {
        loadedProducts.add(Product(
          id: prodId,
          title: prodData['title'],
          description: prodData['description'],
          price: prodData['price'],
          isFavorite: prodData['isFavorite'],
          imageUrl: prodData['imageUrl'],
        ));
      });
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> addProduct(Product product) async {
    const url =
        // 'https://shop-app-39430-default-rtdb.firebaseio.com/products.json';
        'https://shop-app-39430-default-rtdb.firebaseio.com/products.json';
    // print('url tk pahoch gaya hai ');
    try {
      final response = await http.post(
        Uri.parse(url),
        // url,
        body: json.encode({
          'title': product.title,
          'description': product.description,
          'imageUrl': product.imageUrl,
          'price': product.price,
          'isFavourite': product.isFavorite,
        }),
      );
      final newProduct = Product(
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
        id: json.decode(response.body)['name'],
      );

      _items.add(newProduct);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
    // .then((response) {

    // }).catchError((error){
    //   print(error);
    //   throw error;
    // });
    // return Future.value();
  }

  void updateProduct(String id, Product newProduct) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}
