import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavbar extends StatelessWidget {
  int currentIndex = 0;
  void Function(int)? onTap;
  BottomNavbar({super.key, required this.onTap, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 54, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(60)
      ),
      child: SalomonBottomBar(
        selectedItemColor: Color(0xFF435150),
        unselectedItemColor: Color(0xFF242424),
        currentIndex: currentIndex,
        onTap: (value) => onTap!(value),
        items: [
          SalomonBottomBarItem(
            icon: Icon(Iconsax.home),
            title: Text("Home"),
          ),
          SalomonBottomBarItem(
            icon: Icon(Iconsax.shopping_bag),
            title: Text("Cart"),
          ),
          SalomonBottomBarItem(
            icon: Icon(Iconsax.heart),
            title: Text("Wishlist"),
          ),
        ],
      ),
    );
  }
}
