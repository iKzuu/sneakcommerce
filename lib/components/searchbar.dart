import 'package:flutter/material.dart';

class Searchbar extends StatelessWidget {
  final TextEditingController? controller;
  const Searchbar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
        cursorHeight: 18,
        cursorColor: Color(0xFFC9BCAF),
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(8),
          prefixIcon: Icon(Icons.search),
          hintText: "search seneakers...",
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.black.withValues(alpha: 0.3),
            fontWeight: FontWeight.w600
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none
          )
        ),
      );
  }
}