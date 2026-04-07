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

  // size selection
  List<String> availableSize = ["40", "41", "42", "43", "44"];
  String? _tempSelectedSize;
  String? get tempSelectedSize => _tempSelectedSize;

  void setSelectedSize(String size) {
    _tempSelectedSize = size;
    notifyListeners();
  }

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
  void addItemToCart(Shoe shoe, {VoidCallback? onMaxReached, VoidCallback? onSuccess, VoidCallback? onSizeNotSelected}) {
    if (_tempSelectedSize == null) {
      if (onSizeNotSelected != null) onSizeNotSelected();
      return;
    }

    int index = userCart.indexWhere(
      (item) => item.id == shoe.id && item.selectedSize == _tempSelectedSize,
    );

    if (index != -1) {
      if (userCart[index].quantity < 5) {
        userCart[index].quantity++;
        if (onSuccess != null) onSuccess();
      } else {
        if (onMaxReached != null) onMaxReached();
        return;
      }
    } else {
      Shoe newShoe = Shoe(
        id: shoe.id,
        name: shoe.name,
        price: shoe.price,
        imagePath: shoe.imagePath,
        brand: shoe.brand,
        selectedSize: _tempSelectedSize,
        quantity: 1,
      );
      userCart.add(newShoe);
      if (onSuccess != null) onSuccess();
    }

    _tempSelectedSize = null;
    notifyListeners();
  }

  void incrementQuantity(Shoe shoe) {
    if (shoe.quantity < 5) {
      shoe.quantity++;
      notifyListeners();
    }
  }

  void decrementQuantity(Shoe shoe) {
    if (shoe.quantity > 1) {
      shoe.quantity--;
    } else {
      userCart.remove(shoe);
    }
    notifyListeners();
  }

  // get total value for each item in cart if selected and return total price
  double getTotalPrice() {
    double total = 0;
    for (var item in userCart) {
      if (item.isSelected) {
        total += item.priceAsDouble * item.quantity.toInt();
      }
    }
    return total;
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

  // toggle selection in cart page
  void toggleSelection(Shoe shoe) {
    shoe.isSelected = !shoe.isSelected;
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
