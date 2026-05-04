import 'package:hive_flutter/hive_flutter.dart';
import 'package:sneakcommerce/models/address.dart';
import 'package:sneakcommerce/models/cart_item.dart';

class HiveInitializer {
  static Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(AddressAdapter());
    Hive.registerAdapter(CartItemAdapter());

    await Future.wait([
      Hive.openBox<Address>('addressBox'),
      Hive.openBox<CartItem>('cartBox'),
    ]);
  }
}