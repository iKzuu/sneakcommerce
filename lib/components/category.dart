import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  int isSelected = 0;
  int index;
  String name;

  Category({super.key, required this.index, required this.name});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 80,
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: widget.isSelected == widget.index
              ? Color(0xFF242424)
              : Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          widget.name,
          style: TextStyle(
            color: widget.isSelected == widget.index
                ? Colors.white
                : Color(0xFF242424),
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
