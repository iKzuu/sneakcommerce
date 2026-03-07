import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/controller/controller.dart';
import 'package:sneakcommerce/theme/app_colors.dart';

class Category extends StatelessWidget {
  Category({super.key});

  final List<String> categories = ["All", "Nike", "Adidas", "NB", "Puma"];

  @override
  Widget build(BuildContext context) {
    return Consumer<Controller>(
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
                  Provider.of<Controller>(
                    context,
                    listen: false,
                  ).setCategoryIndex(index);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    width: 80,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.onBackground
                          : AppColors.surface,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        color: isSelected
                            ? AppColors.surface
                            : AppColors.onBackground,
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
