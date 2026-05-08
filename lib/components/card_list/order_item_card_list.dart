import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/components/cards/order_item_card.dart';
import 'package:sneakcommerce/controller/order_controller.dart';

class OrderItemCardList extends StatelessWidget {
  const OrderItemCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderController>(
      builder: (context, controller, _) {
        final orders = controller.orders;

        if (orders.isEmpty) {
          return const Center(child: Text("No orders yet"));
        }

        return Column(
          spacing: 16,
          children: orders.map((order) {
            return OrderItemCard(order: order);
          }).toList(),
        );
      },
    );
  }
}
