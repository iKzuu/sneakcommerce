import 'package:flutter/material.dart';
import 'package:sneakcommerce/models/shoe.dart';

class ItemList extends StatefulWidget {
  Shoe shoe;
  double? imageWidth;
  double? imageHeight;
  ItemList({super.key, required this.shoe, this.imageWidth = 110, this.imageHeight = 110});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFAC9A8C).withValues(alpha: .6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: widget.imageWidth,
              height: widget.imageHeight,
              child: Image.network(
                widget.shoe.imagePath,
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
                  widget.shoe.name,
                  style: TextStyle(
                    color: Color(0xFF242424),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
    
                SizedBox(height: 12),
    
                Text(
                  widget.shoe.brand,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.8),
                  ),
                ),
    
                Text(
                  widget.shoe.price,
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
    );
  }
}
