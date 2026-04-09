import 'package:flutter/material.dart';
import 'package:sneakcommerce/data/shipping_data.dart';
import 'package:sneakcommerce/models/shipping.dart';

class ShippingController extends ChangeNotifier {
  List<ShippingMethod> get shippingList => shippingMethods;

  ShippingMethod? _selectedShipping;

  ShippingMethod? get selectedShipping => _selectedShipping;

  void initShipping() {
    _selectedShipping ??= shippingMethods.first;
  }

  void selectShipping(ShippingMethod method) {
    _selectedShipping = method;
    notifyListeners();
  }
}
