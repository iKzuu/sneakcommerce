import 'package:flutter/material.dart';
import 'package:sneakcommerce/pages/search_page.dart';

Route<void> createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animtion, secondaryAnimation) => const SearchPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(-1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}
