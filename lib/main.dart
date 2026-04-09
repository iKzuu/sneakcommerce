import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/controller/controller.dart';
import 'package:sneakcommerce/controller/shipping_controller.dart';
import 'package:sneakcommerce/pages/intro_page.dart';

void main() {
  runApp(const SneakCommerce());
}

class SneakCommerce extends StatelessWidget {
  const SneakCommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Controller()),
        ChangeNotifierProvider(create: (_) => ShippingController()),
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IntroPage(),
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}
