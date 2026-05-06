import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sneakcommerce/controller/address_controller.dart';
import 'package:sneakcommerce/controller/cart_controller.dart';
import 'package:sneakcommerce/controller/payment_method_controller.dart';
import 'package:sneakcommerce/controller/shipping_controller.dart';
import 'package:sneakcommerce/models/order.dart';
import 'package:sneakcommerce/models/order_item.dart';

class OrderController extends ChangeNotifier {
  final Box<Order> _box = Hive.box<Order>('orderBox');

  List<Order> get orders => _box.values.toList();

  Future<bool> checkout({
    required CartController cartController,
    required AddressController addressController,
    required PaymentMethodController paymentController,
    required ShippingController shippingController,
  }) async {
    final address = addressController.selectedAddress;
    final payment = paymentController.selectedPaymentMethod;
    final shipping = shippingController.selectedShipping;
    final cartItems = cartController.selectedItems;

    // validation
    if (address == null ||
        payment == null ||
        shipping == null ||
        cartItems.isEmpty) {
      return false;
    }

    final subtotal = cartItems.fold(
      0,
      (sum, item) => sum + (item.price * item.quantity),
    );

    final total = subtotal + shipping.cost;

    final orderItems = cartItems.map((item) {
      return OrderItem(
        id: item.id,
        name: item.name,
        price: item.price,
        imagePath: item.imagePath,
        quantity: item.quantity,
        selectedSize: item.selectedSize,
      );
    }).toList();

    final order = Order(
      orderId: DateTime.now().millisecondsSinceEpoch.toString(),
      items: orderItems,
      address: address.fullAddress,
      paymentMethod: payment.name,
      shippingMethod: shipping.name,
      subtotal: subtotal,
      shippingCost: shipping.cost,
      totalPrice: total,
      createdAt: DateTime.now(),
    );

    await _box.add(order);

    cartController.clearSelectedItems();

    notifyListeners();

    return true;
  }
}
