import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/components/item_list.dart';
import 'package:sneakcommerce/components/search_tile.dart';
import 'package:sneakcommerce/controller/controller.dart';
import 'package:sneakcommerce/models/shoe.dart';

class SearchItem extends StatefulWidget {
  const SearchItem({super.key});

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Controller>(
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: value.getSearchShoes().length,
            itemBuilder: (context, index) {
              Shoe searchShoe = value.getSearchShoes()[index];

              return SearchTile(
                shoe: searchShoe,
              );
            },
          ),
        );
      },
    );
  }
}
