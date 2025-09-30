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
      margin: EdgeInsets.symmetric(horizontal: 68, vertical: 12),
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

      // margin: EdgeInsets.symmetric(horizontal: 60, vertical: 12),
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.circular(60),
      // ),
      // child: BottomNavigationBar(
      //   backgroundColor: Colors.transparent,
      //   iconSize: 32,
      //   elevation: 0,
      //   selectedItemColor: Color(0xFFC9BCAF),
      //   unselectedItemColor: Color(0xFF242424),
      //   showSelectedLabels: true,
      //   showUnselectedLabels: false,
      //   currentIndex: currentIndex,
      //   onTap: (value) => onTap!(value),
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: ImageIcon(AssetImage('assets/icons/home.png')),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: ImageIcon(AssetImage('assets/icons/bag.png')),
      //       label: 'Cart',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: ImageIcon(AssetImage('assets/icons/heart.png')),
      //       label: 'Wishlist',
      //     ),
      //   ],
      // ),
    );
  }
}
