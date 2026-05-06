import 'package:provider/provider.dart';
import 'package:sneakcommerce/controller/address_controller.dart';
import 'package:sneakcommerce/controller/cart_controller.dart';
import 'package:sneakcommerce/controller/order_controller.dart';
import 'package:sneakcommerce/controller/shoe_controller.dart';
import 'package:sneakcommerce/controller/payment_method_controller.dart';
import 'package:sneakcommerce/controller/shipping_controller.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sneakcommerce/controller/shoe_search_controller.dart';
import 'package:sneakcommerce/controller/wishlist_controller.dart';

class AppProviders {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => ShoeController()),
    ChangeNotifierProvider(create: (_) => ShippingController()),
    ChangeNotifierProvider(create: (_) => PaymentMethodController()),
    ChangeNotifierProvider(create: (_) => AddressController()),
    ChangeNotifierProvider(create: (_) => CartController()),

    ChangeNotifierProxyProvider<ShoeController, WishlistController>(
      create: (context) => WishlistController(context.read<ShoeController>()),
      update: (context, shoeController, previous) {
        final controller = WishlistController(shoeController);
        controller.syncWishlistToShoe();
        return controller;
      },
    ),

    ChangeNotifierProvider(create: (_) => ShoeSearchController()),
    ChangeNotifierProvider(create: (_) => OrderController()),
  ];
}
