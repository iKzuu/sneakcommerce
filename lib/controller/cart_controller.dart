import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sneakcommerce/models/cart_item.dart';
import 'package:sneakcommerce/models/shoe.dart';

class CartController extends ChangeNotifier {
  final Box<CartItem> _box = Hive.box<CartItem>('cartBox');
  List<CartItem> get userCartItem => _box.values.toList();

  // size selection
  List<String> availableSize = ["40", "41", "42", "43", "44"];
  String? _tempSelectedSize;
  String? get tempSelectedSize => _tempSelectedSize;

  void setSelectedSize(String size) {
    _tempSelectedSize = size;
    notifyListeners();
  }

  // add items to cart
  void addItemToCart(
    Shoe shoe, {
    VoidCallback? onMaxReached,
    VoidCallback? onSuccess,
    VoidCallback? onSizeNotSelected,
  }) {
    if (_tempSelectedSize == null) {
      onSizeNotSelected?.call();
      return;
    }

    CartItem? existing;

    try {
      existing = _box.values.firstWhere(
        (item) => item.id == shoe.id && item.selectedSize == _tempSelectedSize,
      );
    } catch (_) {
      existing = null;
    }

    if (existing != null) {
      if (existing.quantity < 5) {
        existing.quantity++;
        existing.save();
        onSuccess?.call();
      } else {
        onMaxReached?.call();
        return;
      }
    } else {
      final newItem = CartItem(
        id: shoe.id,
        name: shoe.name,
        price: shoe.price,
        imagePath: shoe.imagePath,
        brand: shoe.brand,
        selectedSize: _tempSelectedSize,
        quantity: 1,
      );
      _box.add(newItem);
      onSuccess?.call();
    }

    _tempSelectedSize = null;
    notifyListeners();
  }

  // quantity
  void incrementQuantity(CartItem item) {
    if (item.quantity < 5) {
      item.quantity++;
      item.save();
      notifyListeners();
    }
  }

  void decrementQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
      item.save();
    } else {
      item.delete();
    }
    notifyListeners();
  }

  // get total item is selected
  int get selectedItemQuantity => _box.values
      .where((item) => item.isSelected)
      .fold(0, (sum, item) => sum + item.quantity);

  // get total all quantity selected item
  int get totalQuantity =>
      _box.values.fold(0, (sum, item) => sum + item.quantity);

  // get total value for each item in cart if selected and return total price
  double get totalPrice => _box.values
      .where((item) => item.isSelected)
      .fold(0, (sum, item) => sum + item.priceAsDouble * item.quantity);

  // check if there is selected item in cart
  bool get hasSelectedItem => _box.values.any((item) => item.isSelected);

  // remove items from cart
  void removeItemFromCart(CartItem item) {
    item.delete();
    notifyListeners();
  }

  // toggle selection in cart page
  void toggleSelection(CartItem item) {
    item.isSelected = !item.isSelected;
    item.save();
    notifyListeners();
  }

  List<CartItem> get selectedItems =>
      _box.values.where((item) => item.isSelected).toList();
}
