import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sneakcommerce/controller/shoe_controller.dart';
import 'package:sneakcommerce/models/shoe.dart';

class WishlistController extends ChangeNotifier {
  final ShoeController shoeController;
  final Box<int> box = Hive.box<int>('wishlistBox');

  WishlistController(this.shoeController);

  List<int> get wishlistIds => box.values.toList();

  bool isFavorite(int shoeId) {
    return box.values.contains(shoeId);
  }

  List<Shoe> getWihlistShoes() {
    return shoeController.shoeShopList.where((s) => isFavorite(s.id)).toList();
  }

  // toggle wishlist icon when adding or removing item from wishlist
  void toggleFavorite(int shoeId) {
    if (isFavorite(shoeId)) {
      final key = box.keys.firstWhere((k) => box.get(k) == shoeId);
      box.delete(key);
    } else {
      box.add(shoeId);
    }

    final shoe = shoeController.shoeShopList.firstWhere((s) => s.id == shoeId);

    shoe.isFavorite = !shoe.isFavorite;

    notifyListeners();
    shoeController.notifyListeners();
  }

  void syncWishlistToShoe() {
    final ids = wishlistIds;

    for (var shoe in shoeController.shoeShopList) {
      shoe.isFavorite = ids.contains(shoe.id);
    }
  }
}
