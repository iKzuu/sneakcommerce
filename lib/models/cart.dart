import 'package:flutter/material.dart';
import 'package:sneakcommerce/models/shoe.dart';

class Cart extends ChangeNotifier {
  // List of all shoe
  List<Shoe> shoeShop = [
    Shoe(
      id: 1,
      name: "Air Max 1",
      price: "Rp 1.349.000",
      imagePath:
          "https://static.nike.com/a/images/t_PDP_936_v1/f_auto,q_auto:eco/c071c9c3-2ca1-4919-b36b-68c0dd4e4588/AIR+MAX+1+%28GS%29.png",
      brand: "Nike",
    ),
    Shoe(
      id: 2,
      name: "Zoom Vomero 5",
      price: "Rp 2.489.000",
      imagePath:
          "https://static.nike.com/a/images/t_PDP_936_v1/f_auto,q_auto:eco/c439dab9-d549-4a05-a752-618139bca22f/NIKE+ZOOM+VOMERO+5.png",
      brand: "Nike",
    ),
    Shoe(
      id: 3,
      name: "Air Max 90",
      price: "Rp 1.869.000",
      imagePath:
          "https://static.nike.com/a/images/t_PDP_936_v1/f_auto,q_auto:eco/1ccfdc55-fda5-402c-87be-61296f1b01d9/AIR+MAX+90.png",
      brand: "Nike",
    ),
    Shoe(
      id: 4,
      name: "Air Force 1 '07",
      price: "Rp 1.729.000",
      imagePath:
          "https://static.nike.com/a/images/t_PDP_936_v1/f_auto,q_auto:eco/350e7f3a-979a-402b-9396-a8a998dd76ab/AIR+FORCE+1+%2707.png",
      brand: "Nike",
    ),
    Shoe(
      id: 5,
      name: "P 6000",
      price: "Rp 1.729.000",
      imagePath:
          "https://static.nike.com/a/images/t_PDP_936_v1/f_auto,q_auto:eco/2dc25c65-c75f-43ef-8372-310ae4615c6d/NIKE+P-6000.png",
      brand: "Nike",
    ),

    Shoe(
      id: 6,
      name: "Campus 00s",
      price: "Rp 1.700.000",
      imagePath:
          "https://www.adidas.co.id/media/catalog/product/h/q/hq8707_2_footwear_photography_side20lateral20view_grey.jpg",
      brand: "Adidas",
    ),
    Shoe(
      id: 7,
      name: "Stan Smith",
      price: "Rp 950.000",
      imagePath:
          "https://www.adidas.co.id/media/catalog/product/i/g/ig1323_5_footwear_photography_side20medial20center20view_grey.jpg",
      brand: "Adidas",
    ),
    Shoe(
      id: 8,
      name: "Samba OG",
      price: "Rp 2.200.000",
      imagePath:
          "https://www.adidas.co.id/media/catalog/product/b/7/b75806_smc_ecom.jpg",
      brand: "Adidas",
    ),
    Shoe(
      id: 9,
      name: "Gazelle",
      price: "Rp 1.700.000",
      imagePath:
          "https://www.adidas.co.id/media/catalog/product/b/b/bb5478_smc_ecom.jpg",
      brand: "Adidas",
    ),
    Shoe(
      id: 10,
      name: "SC Powerphase",
      price: "Rp 2.000.000",
      imagePath:
          "https://www.adidas.co.id/media/catalog/product/j/q/jq3936_5_footwear_photography_side20medial20center20view_grey.jpg",
      brand: "Adidas",
    ),

    Shoe(
      id: 11,
      name: "Teddy Santis 990",
      price: "Rp 3.999.200",
      imagePath:
          "https://www.newbalance.co.id/media/catalog/product/cache/b444f50a64a092a2138a5e1cbd49879a/0/8/0888-newu990mm600y10h-2.jpg",
      brand: "New Balance",
    ),
    Shoe(
      id: 12,
      name: "2002R",
      price: "Rp 1.819.300",
      imagePath:
          "https://www.newbalance.co.id/media/catalog/product/cache/b444f50a64a092a2138a5e1cbd49879a/0/2/02-NEW-BALANCE-FFSSBNEW0-NEWML2002RC-Grey.jpg",
      brand: "New Balance",
    ),
    Shoe(
      id: 13,
      name: "574 EVERGREEN",
      price: "Rp 1.799.000",
      imagePath:
          "https://www.newbalance.co.id/media/catalog/product/cache/b444f50a64a092a2138a5e1cbd49879a/0/2/02-NEW-BALANCE-FFSSBNEW0-NEWML574EVG-Grey.jpg",
      brand: "New Balance",
    ),
    Shoe(
      id: 14,
      name: "New Balance 530",
      price: "Rp 1.699.000",
      imagePath:
          "https://www.newbalance.co.id/media/catalog/product/cache/b444f50a64a092a2138a5e1cbd49879a/0/2/02-NEW-BALANCE-FFSSBNEWA-NEWMR530CK-Grey.jpg",
      brand: "New Balance",
    ),
    Shoe(
      id: 15,
      name: "New Balance 740",
      price: "Rp 1.899.000",
      imagePath:
          "https://www.newbalance.co.id/media/catalog/product/cache/b444f50a64a092a2138a5e1cbd49879a/0/8/0888-NEWU740WN200W08H-2.jpg",
      brand: "New Balance",
    ),
  ];

  // list of items user cart
  List<Shoe> userCart = [];

  // list of items user wishlist
  List<Shoe> userWishlist = [];

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

  // filtering brand of shoe
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

  // get list of shoe
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // get wishlist
  List<Shoe> getUserWishlist() {
    return userWishlist;
  }

  // get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  // add item to wishlist
  void addItemToWishlist(Shoe shoe) {
    userWishlist.add(shoe);
    notifyListeners();
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
      shoeShop[index].isFavorite = !shoeShop[index].isFavorite;
      notifyListeners();
    }
  }
}
