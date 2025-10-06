import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/models/cart.dart';

class Category extends StatelessWidget {
  Category({super.key});

  final List<String> categories = ["All", "Nike", "Adidas", "NB", "Puma"];

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) {
        return SizedBox(
          height: 30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final isSelected = value.selectedCategoryIndex == index;

              return GestureDetector(
                onTap: () {
                  Provider.of<Cart>(context, listen: false).setCategoryIndex(index);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: 80,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Color(0xFF242424)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        color: isSelected
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
      },
    );
  }
}
