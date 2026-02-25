import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/components/item_list.dart';
import 'package:sneakcommerce/data/shoe_data.dart';
import 'package:sneakcommerce/models/shoe.dart';
import 'package:sneakcommerce/controller/controller.dart';
import 'package:sneakcommerce/pages/detail_page.dart';

class SearchTile extends StatefulWidget {
  Shoe shoe;
  SearchTile({super.key, required this.shoe});

  @override
  State<SearchTile> createState() => _SearchTileState();
}

class _SearchTileState extends State<SearchTile> {
  void addShoeToCart(Shoe shoe) {
    Provider.of<Controller>(context, listen: false).addItemToCart(shoe);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color(0xFF435150),
        title: Text(
          "Added 1 item to cart",
          style: TextStyle(color: Colors.white),
        ),
        content: Text("Check your cart", style: TextStyle(color: Colors.white)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Controller>(
      builder: (context, value, child) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(shoeId: widget.shoe.id)));
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFAC9A8C).withValues(alpha: .6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                  // shoe list
                  ItemList(shoe: widget.shoe, imageWidth: 80, imageHeight: 80),
          
                  Positioned(
                    right: 20,
                    child: Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            value.toggleFavorite(widget.shoe.id);
                          },
          
                          icon: widget.shoe.isFavorite
                              ? Icon(
                                  Icons.favorite_rounded,
                                  color: Color(0xFF435150),
                                )
                              : Icon(
                                  Icons.favorite_border_rounded,
                                  color: Color(0xFF435150),
                                ),
                        ),
          
                        GestureDetector(
                          onTap: () => addShoeToCart(widget.shoe),
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(0xFF435150),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Iconsax.shopping_bag5,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
