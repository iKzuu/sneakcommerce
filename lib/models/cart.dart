import 'package:flutter/material.dart';
import 'package:sneakcommerce/models/shoe.dart';

class Cart extends ChangeNotifier{

  // List of shoe
  List<Shoe> shoeShop = [
    Shoe(
      name: "Air Max 1",
      price: "Rp 1.349.000",
      imagePath:
          "https://static.nike.com/a/images/t_PDP_936_v1/f_auto,q_auto:eco/c071c9c3-2ca1-4919-b36b-68c0dd4e4588/AIR+MAX+1+%28GS%29.png",
      brand: "Nike",
    ),
    Shoe(
      name: "Zoom Vomero 5",
      price: "Rp 2.489.000",
      imagePath:
          "https://static.nike.com/a/images/t_PDP_936_v1/f_auto,q_auto:eco/c439dab9-d549-4a05-a752-618139bca22f/NIKE+ZOOM+VOMERO+5.png",
      brand: "Nike",
    ),
    Shoe(
      name: "Air Max 90",
      price: "Rp 1.869.000",
      imagePath:
          "https://static.nike.com/a/images/t_PDP_936_v1/f_auto,q_auto:eco/1ccfdc55-fda5-402c-87be-61296f1b01d9/AIR+MAX+90.png",
      brand: "Nike",
    ),
    Shoe(
      name: "Air Force 1 '07",
      price: "Rp 1.729.000",
      imagePath:
          "https://static.nike.com/a/images/t_PDP_936_v1/f_auto,q_auto:eco/350e7f3a-979a-402b-9396-a8a998dd76ab/AIR+FORCE+1+%2707.png",
      brand: "Nike",
    ),
    Shoe(
      name: "P 6000",
      price: "Rp 1.729.000",
      imagePath:
          "https://static.nike.com/a/images/t_PDP_936_v1/f_auto,q_auto:eco/2dc25c65-c75f-43ef-8372-310ae4615c6d/NIKE+P-6000.png",
      brand: "Nike",
    ),
  ];

  // list of items user cart
  List<Shoe> userCart = [];

  // get list of shoe
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // get cart
  List<Shoe> getUserCart() {
    return userCart;
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
}
