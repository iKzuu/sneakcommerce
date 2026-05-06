import 'package:hive_flutter/adapters.dart';
import 'package:sneakcommerce/models/order_item.dart';

part 'order.g.dart';

@HiveType(typeId: 3)
class Order {
  @HiveField(0)
  String orderId;

  @HiveField(1)
  List<OrderItem> items;

  @HiveField(2)
  String address;

  @HiveField(3)
  String paymentMethod;

  @HiveField(4)
  String shippingMethod;

  @HiveField(5)
  int subtotal;

  @HiveField(6)
  int shippingCost;

  @HiveField(7)
  num totalPrice;

  @HiveField(8)
  DateTime createdAt;

  Order({
    required this.orderId,
    required this.items,
    required this.address,
    required this.paymentMethod,
    required this.shippingMethod,
    required this.subtotal,
    required this.shippingCost,
    required this.totalPrice,
    required this.createdAt,
  });
}
