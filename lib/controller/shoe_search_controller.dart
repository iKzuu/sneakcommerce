import 'package:flutter/material.dart';
import 'package:sneakcommerce/data/shoe_data.dart';
import 'package:sneakcommerce/models/shoe.dart';

class ShoeSearchController extends ChangeNotifier {
  List<Shoe> get shoeShopSearchlist => shoeShop;

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
}
