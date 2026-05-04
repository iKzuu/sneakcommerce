import 'package:hive/hive.dart';

part 'cart_item.g.dart';

@HiveType(typeId: 1)
class CartItem extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  int price;

  @HiveField(3)
  String imagePath;

  @HiveField(4)
  String brand;

  @HiveField(5)
  int quantity;

  @HiveField(6)
  String? selectedSize;

  @HiveField(7)
  bool isSelected;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.imagePath,
    required this.brand,
    this.quantity = 1,
    this.selectedSize,
    this.isSelected = true,
  });

  double get priceAsDouble => price.toDouble();
}