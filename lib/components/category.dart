import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  int selectedIndex = 0;
  final List<String> categories = ["All", "Nike", "Adidas", "NB"];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => setState(() => selectedIndex = index),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                width: 80,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: selectedIndex == index
                      ? Color(0xFF242424)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  categories[index],
                  style: TextStyle(
                    color: selectedIndex == index
                        ? Colors.white
                        : Color(0xFF242424),
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
