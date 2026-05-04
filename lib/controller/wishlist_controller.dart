import 'package:flutter/material.dart';
import 'package:sneakcommerce/data/shoe_data.dart';
import 'package:sneakcommerce/models/shoe.dart';

class WishlistController extends ChangeNotifier {
  List<Shoe> get shoeShopWishList => shoeShop;

  // list of items user wishlist
  List<Shoe> userWishlist = [];

  // get wishlist
  List<Shoe> get userWishlistItem => userWishlist;

  // remove items from wishlist
  void removeItemFromWishlist(Shoe shoe) {
    userWishlist.remove(shoe);
    notifyListeners();
  }

  // toggle wishlist icon when adding or removing item from wishlist
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
