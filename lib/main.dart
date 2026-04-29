import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/core/app_initializer.dart';
import 'package:sneakcommerce/core/app_providers.dart';
import 'package:sneakcommerce/pages/intro_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppInitializer.init();

  runApp(const SneakCommerce());
}

class SneakCommerce extends StatelessWidget {
  const SneakCommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.providers,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IntroPage(),
        theme: ThemeData(fontFamily: 'Poppins'),
      ),
    );
  }
}
