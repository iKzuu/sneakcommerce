import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sneakcommerce/core/hive_initializer.dart';

class AppInitializer {
  static Future<void> init() async {
    await dotenv.load(fileName: ".env");

    await HiveInitializer.init();
  }
}