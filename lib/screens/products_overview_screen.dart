import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../widgets/product_item.dart';
import '../providers/product.dart';
import '../widgets/products_grid.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    final productsContainer = Provider.of<Products>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("MyShop"),
          actions: <Widget>[
            PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                // print(selectedValue);
                setState(() {
                  if (selectedValue == FilterOptions.Favorites) {
                    _showOnlyFavorites = true;
                    // productsContainer.showFavoriteOnly();
                  } else {
                    _showOnlyFavorites = false;
                    // productsContainer.showAll();
                  }
                });
              },
              icon: Icon(
                Icons.more_vert,
              ),
              itemBuilder: (_) => [
                PopupMenuItem(
                    child: Text("Only Favorites"),
                    value: FilterOptions.Favorites),
                PopupMenuItem(
                    child: Text("Show All"), value: FilterOptions.All),
              ],
            )
          ],
          centerTitle: true,
        ),
        body: ProductsGrid(_showOnlyFavorites),
      ),
    );
  }
}
