import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
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
            itemCount: value.shoes.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFAC9A8C).withValues(alpha: .6),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Stack(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 80,
                              height: 80,
                              child: Image.network(
                                value.shoes[index].imagePath,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  value.shoes[index].name,
                                  style: TextStyle(
                                    color: Color(0xFF242424),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),

                                SizedBox(height: 12),

                                Text(
                                  value.shoes[index].brand,
                                  style: TextStyle(
                                    color: Colors.white.withValues(alpha: 0.8),
                                  ),
                                ),

                                Text(
                                  value.shoes[index].price,
                                  style: TextStyle(
                                    color: Color(0xFF464646),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      Positioned(
                        right: 20,
                        child: Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                value.shoes[index].isFavorite
                                    ? Provider.of<Cart>(
                                        context,
                                        listen: false,
                                      ).removeItemFromWishlist(
                                        value.shoes[index],
                                      )
                                    : Provider.of<Cart>(
                                        context,
                                        listen: false,
                                      ).addItemToWishlist(value.shoes[index]);
                                value.toggleFavorite(value.shoes[index].id);
                              },

                              icon: value.shoes[index].isFavorite
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
                              onTap: () => addShoeToCart(value.shoes[index]),
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
