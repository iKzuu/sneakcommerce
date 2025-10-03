import 'package:flutter/material.dart';
import 'package:sneakcommerce/components/bottom_navbar.dart';
import 'package:sneakcommerce/pages/cart_page.dart';
import 'package:sneakcommerce/pages/route_transition.dart';
import 'package:sneakcommerce/pages/shop_page.dart';
import 'package:sneakcommerce/pages/wishlist_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  bool isSearchClicked = false;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    ShopPage(),
    CartPage(),
    WishlistPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC9BCAF),
      appBar: AppBar(
        backgroundColor: Color(0xFF435150),
        title: Text(
                "SneakCommerce.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).push(createRoute()),
            icon: Icon(Icons.search),
            color: Colors.white,
          ),
        ],
        automaticallyImplyLeading: false,
      ),

      body: _pages[_selectedIndex],
      
      bottomNavigationBar: SafeArea(
        child: BottomNavbar(
          currentIndex: _selectedIndex,
          onTap: (index) => navigateBottomBar(index),
        ),
      ),
    );
  }
}
