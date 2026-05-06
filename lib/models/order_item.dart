import 'package:hive_flutter/hive_flutter.dart';

part 'order_item.g.dart';

@HiveType(typeId: 2)
class OrderItem extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  int price;

  @HiveField(3)
  String imagePath;

  @HiveField(4)
  int quantity;

  @HiveField(5)
  String? selectedSize;

  OrderItem({
    required this.id,
    required this.name,
    required this.price,
    required this.imagePath,
    required this.quantity,
    this.selectedSize
  });
}