import 'package:flutter/material.dart';
import 'package:sneakcommerce/data/shoe_data.dart';
import 'package:sneakcommerce/models/shoe.dart';

class ShoeController extends ChangeNotifier {

  // get shoe data
  List<Shoe> get shoeShopList => shoeShop;

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
}
