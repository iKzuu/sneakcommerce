import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/components/cards/product_card.dart';
import 'package:sneakcommerce/controller/shoe_search_controller.dart';
import 'package:sneakcommerce/models/shoe.dart';

class SearchListItems extends StatelessWidget {
  const SearchListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ShoeSearchController>(
      builder: (context, value, child) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: value.getSearchShoes().length,
          itemBuilder: (context, index) {
            Shoe searchShoe = value.getSearchShoes()[index];

            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: ProductCard(
                shoe: searchShoe,
                imageWidth: 80,
                imageHeight: 80,
              ),
            );
          },
        );
      },
    );
  }
}
