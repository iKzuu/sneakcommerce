import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:sneakcommerce/theme/app_colors.dart';

class BottomNavbar extends StatelessWidget {
  int currentIndex = 0;
  void Function(int)? onTap;
  BottomNavbar({super.key, required this.onTap, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 54, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(60),
      ),
      child: SalomonBottomBar(
        selectedItemColor: AppColors.onSurface,
        unselectedItemColor: AppColors.onSurfaceVariant,
        currentIndex: currentIndex,
        onTap: (value) => onTap!(value),
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home_rounded),
            title: Text("Home"),
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.receipt),
            title: Text("Orders"),
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.favorite_rounded),
            title: Text("Wishlist"),
          ),
        ],
      ),
    );
  }
}
