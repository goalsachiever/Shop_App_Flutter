import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import 'package:shop_app/widgets/badge.dart';
import '../providers/cart.dart';
import '../providers/products.dart';
import '../widgets/product_item.dart';
import '../providers/product.dart';
import '../widgets/products_grid.dart';
import 'package:http/http.dart' as http;

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
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    // http.get();
    // Provider.of<Products>(context).fetchAndSetProduct();
    // Future.delayed(Duration.zero).then((_){
    //   Provider.of<Products>(context).fetchAndSetProduct();
    //
    // });
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies()  {
    // TODO: implement didChangeDependencies
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<Products>(context).fetchAndSetProduct().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
      }
    _isInit = false;
          super.didChangeDependencies();
    }

  @override
  Widget build(BuildContext context) {
    final productsContainer = Provider.of<Products>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(

          title: Text("MyShop"),
          // centerTitle: true,
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
              itemBuilder: (_) =>
              [
                PopupMenuItem(
                    child: Text("Only Favorites"),
                    value: FilterOptions.Favorites),
                PopupMenuItem(
                    child: Text("Show All"), value: FilterOptions.All),
              ],
            ),
            Consumer<Cart>(
              builder: (_, cart, ch) =>
                  Badge(
                    child: ch!,
                    value: cart.itemCount.toString(),
                    color: Colors.deepOrange,
                  ),
              child: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                ),
                onPressed: () {
                  // print("push");
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              ),
            ),
          ],

        ),
        drawer: AppDrawer(),
        body: _isLoading ? Center(child: CircularProgressIndicator(),) : ProductsGrid(_showOnlyFavorites),
        // body: _isLoading ?  : ProductsGrid(_showOnlyFavorites),
      ),
    );
  }
}
