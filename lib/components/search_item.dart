import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/components/item_list.dart';
import 'package:sneakcommerce/models/cart.dart';
import 'package:sneakcommerce/models/shoe.dart';

class SearchItem extends StatefulWidget {
  const SearchItem({super.key});

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

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
    return Consumer<Cart>(
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: value.getSearchShoes().length,
            itemBuilder: (context, index) {
              Shoe searchShoe = value.getSearchShoes()[index];

              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFAC9A8C).withValues(alpha: .6),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Stack(
                    children: [
                      
                      // shoe list
                      ItemList(
                        shoe: searchShoe,
                        imageWidth: 80,
                        imageHeight: 80,
                      ),

                      Positioned(
                        right: 20,
                        child: Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                searchShoe.isFavorite
                                    ? Provider.of<Cart>(
                                        context,
                                        listen: false,
                                      ).removeItemFromWishlist(
                                        searchShoe,
                                      )
                                    : Provider.of<Cart>(
                                        context,
                                        listen: false,
                                      ).addItemToWishlist(searchShoe);
                                value.toggleFavorite(searchShoe.id);
                              },

                              icon: searchShoe.isFavorite
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
                              onTap: () => addShoeToCart(searchShoe),
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
              );
            },
          ),
        );
      },
    );
  }
}
