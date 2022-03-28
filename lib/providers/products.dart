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
        id: 'p4',
        title: 'Blue Shirt',
        description: 'A red shirt - its a preety red! ',
        price: 29.90,
        imageUrl:
            "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
    Product(
        id: 'p5',
        title: 'Orange Shirt',
        description: 'A red shirt - its a preety red! ',
        price: 29.90,
        imageUrl:
            "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
    Product(
        id: 'p6',
        title: 'Orange Shirt',
        description: 'A red shirt - its a preety red! ',
        price: 29.90,
        imageUrl:
            "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
    Product(
        id: 'p7',
        title: 'Orange Shirt',
        description: 'A red shirt - its a preety red! ',
        price: 29.90,
        imageUrl:
            "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
    Product(
        id: 'p8',
        title: 'Orange Shirt',
        description: 'A red shirt - its a preety red! ',
        price: 29.90,
        imageUrl:
            "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
    Product(
        id: 'p9',
        title: 'Orange Shirt',
        description: 'A red shirt - its a preety red! ',
        price: 29.90,
        imageUrl:
            "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
    Product(
        id: 'p10',
        title: 'Orange Shirt',
        description: 'A red shirt - its a preety red! ',
        price: 29.90,
        imageUrl:
            "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
    Product(
        id: 'p11',
        title: 'Orange Shirt',
        description: 'A red shirt - its a preety red! ',
        price: 29.90,
        imageUrl:
            "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
    Product(
        id: 'p13',
        title: 'Orange Shirt',
        description: 'A red shirt - its a preety red! ',
        price: 29.90,
        imageUrl:
            "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
    Product(
        id: 'p14',
        title: 'Orange Shirt',
        description: 'A red shirt - its a preety red! ',
        price: 29.90,
        imageUrl:
            "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
    Product(
        id: 'p15',
        title: 'Orange Shirt',
        description: 'A red shirt - its a preety red! ',
        price: 29.90,
        imageUrl:
            "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
    Product(
        id: 'p16',
        title: 'Orange Shirt',
        description: 'A red shirt - its a preety red! ',
        price: 29.90,
        imageUrl:
            "https://m.media-amazon.com/images/I/51hPifFFT4L._UY741_.jpg"),
    Product(
        id: 'p17',
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

  void addProduct(Product product) {

    final newProduct = Product(
      title: product.title,
      description: product.description,
      price: product.price,
      imageUrl: product.imageUrl,
      id: DateTime.now().toString(),
    );

    _items.add(newProduct);

    notifyListeners();
  }
  void updateProduct(String id,Product newProduct)
  {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if(prodIndex >=0)
      {
        _items[prodIndex] = newProduct;
        notifyListeners();
      }
    else
      {
        print('...');
      }
  }
  
  void deleteProduct(String id)
  {
    _items.removeWhere((prod) => prod.id == id );
    notifyListeners();
  }
}
