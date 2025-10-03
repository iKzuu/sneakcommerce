import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/models/cart.dart';

class Searchbar extends StatefulWidget {
  final TextEditingController controller;
  const Searchbar({super.key, required this.controller});

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        cursorHeight: 18,
        cursorColor: Color(0xFFC9BCAF),
        controller: widget.controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(8),
          prefixIcon: Icon(Icons.search, size: 20, color: Color(0xFF435150)),
          hintText: "search seneakers...",
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.black.withValues(alpha: 0.3),
            fontWeight: FontWeight.w600,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (value) => Provider.of<Cart>(context, listen: false).setSearchQuery(value),
      ),
    );
  }
}
