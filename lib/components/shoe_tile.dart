import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sneakcommerce/models/shoe.dart';

class ShoeTile extends StatefulWidget {
  Shoe shoe;
  void Function()? onTap;
  ShoeTile({super.key, required this.shoe, required this.onTap});

  @override
  State<ShoeTile> createState() => _ShoeTileState();
}

class _ShoeTileState extends State<ShoeTile> {
  bool isFavoriteClicked = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 12.0),
          width: 180,
          decoration: BoxDecoration(
            color: Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.network(widget.shoe.imagePath)),

                Text(
                  widget.shoe.name,
                  style: TextStyle(
                    color: Color(0xFF242424),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.shoe.brand,
                          style: TextStyle(
                            color: Color(0xFF464646).withValues(alpha: 0.6),
                          ),
                        ),

                        Text(
                          widget.shoe.price,
                          style: TextStyle(
                            color: Color(0xFF464646),
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),

                    GestureDetector(
                      onTap: widget.onTap,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xFF435150),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(Iconsax.shopping_bag5, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        Positioned(
          top: 6,
          right: 20,
          child: IconButton(
            onPressed: () {
              setState(() {
                isFavoriteClicked = !isFavoriteClicked;
              });
            },
            icon: isFavoriteClicked
                ? Icon(Icons.favorite_rounded, color: Color(0xFF435150))
                : Icon(Icons.favorite_border_rounded, color: Color(0xFF435150)),
          ),
        ),
      ],
    );
  }
}
