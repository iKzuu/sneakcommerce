import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/models/cart.dart';
import 'package:sneakcommerce/pages/intro_page.dart';

void main() {
  runApp(const SneakCommerce());
}

class SneakCommerce extends StatelessWidget {
  const SneakCommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IntroPage(),
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFFC9BCAF),
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}
