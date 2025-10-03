import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/models/cart.dart';

class SearchItem extends StatefulWidget {
  const SearchItem({super.key});

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: value.shoes.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Container(
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
              ),
            ),
          ),
        );
      },
    );
  }
}
