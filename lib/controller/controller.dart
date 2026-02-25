import 'package:flutter/material.dart';
import 'package:sneakcommerce/data/shoe_data.dart';
import 'package:sneakcommerce/models/shoe.dart';

class Controller extends ChangeNotifier {
  List<Shoe> get shoeShopList => shoeShop;

  // list of items user cart
  List<Shoe> userCart = [];

  // list of items user wishlist
  List<Shoe> userWishlist = [];

  // get wishlist
  List<Shoe> get userWishlistItem => userWishlist;

  // get cart
  List<Shoe> get userCartItem => userCart;

  // search filter
  String _searchQuery = "";

  List<Shoe> getSearchShoes() {
    final query = _searchQuery.toLowerCase();

    return query.isEmpty
        ? []
        : shoeShop
              .where((shoe) => shoe.name.toLowerCase().contains(query))
              .toList();
  }

  void setSearchQuery(String searchQuery) {
    _searchQuery = searchQuery;
    notifyListeners();
  }

  // filter shoe by brand 
  final List<String> categories = ["All", "Nike", "Adidas", "NB", "Puma"];
  int _selectedCategoryIndex = 0;
  int get selectedCategoryIndex => _selectedCategoryIndex;

  final Map<String, String> _brandAliases = {
    "Nike": "Nike",
    "Adidas": "Adidas",
    "NB": "New Balance",
    "Puma": "Puma",
  };

  void setCategoryIndex(int index) {
    _selectedCategoryIndex = index;
    notifyListeners();
  }

  List<Shoe> get filteredShoes {
    final selectedCategoryAlias = categories[_selectedCategoryIndex];

    if (selectedCategoryAlias == "All") {
      return shoeShop;
    }

    final actualBrandName =
        _brandAliases[selectedCategoryAlias] ?? selectedCategoryAlias;

    return shoeShop
        .where(
          (shoe) => shoe.brand.toLowerCase() == actualBrandName.toLowerCase(),
        )
        .toList();
  }

  // add items to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // remove items from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }

  // remove items from wishlist
  void removeItemFromWishlist(Shoe shoe) {
    userWishlist.remove(shoe);
    notifyListeners();
  }

  void toggleFavorite(int shoeId) {
    final index = shoeShop.indexWhere((shoe) => shoe.id == shoeId);
    if (index != -1) {
      final shoe = shoeShop[index];

      shoe.isFavorite = !shoe.isFavorite;

      if (shoe.isFavorite) {
        userWishlist.add(shoe);
      } else {
        userWishlist.remove(shoe);
      }

      notifyListeners();
    }
  }
}
