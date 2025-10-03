import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/models/cart.dart';
import 'package:sneakcommerce/models/shoe.dart';

class ShoeTile extends StatefulWidget {
  Shoe shoe;
  int shoeId;
  void Function()? onTap;
  void Function()? onPressed;
  ShoeTile({
    super.key,
    required this.shoe,
    required this.onTap,
    required this.onPressed,
    required this.shoeId,
  });

  @override
  State<ShoeTile> createState() => _ShoeTileState();
}

class _ShoeTileState extends State<ShoeTile> {
  
  void removeItemFromWishlist() {
    Provider.of<Cart>(
      context,
      listen: false,
    ).removeItemFromWishlist(widget.shoe);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) {
        final shoe = value.shoeShop.firstWhere((s) => s.id == widget.shoeId);

        return Stack(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SizedBox(
                      width: 160,
                      height: 160,
                      child: Image.network(
                        widget.shoe.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

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
                              fontSize: 12,
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
                          child: Icon(
                            Iconsax.shopping_bag5,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Positioned(
              top: 6,
              right: 10,
              child: IconButton(
                onPressed: () {
                  shoe.isFavorite
                      ? removeItemFromWishlist()
                      : widget.onPressed!();
                  value.toggleFavorite(shoe.id);
                },

                icon: shoe.isFavorite
                    ? Icon(Icons.favorite_rounded, color: Color(0xFF435150))
                    : Icon(
                        Icons.favorite_border_rounded,
                        color: Color(0xFF435150),
                      ),
              ),
            ),
          ],
        );
      },
    );
  }
}
