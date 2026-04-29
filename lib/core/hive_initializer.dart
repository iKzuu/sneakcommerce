import 'package:hive_flutter/hive_flutter.dart';
import 'package:sneakcommerce/models/address.dart';

class HiveInitializer {
  static Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(AddressAdapter());

    await Future.wait([
      Hive.openBox<Address>('addressBox'),
    ]);
  }
}