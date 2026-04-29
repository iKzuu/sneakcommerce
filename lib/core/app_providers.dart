import 'package:provider/provider.dart';
import 'package:sneakcommerce/controller/address_controller.dart';
import 'package:sneakcommerce/controller/controller.dart';
import 'package:sneakcommerce/controller/payment_method_controller.dart';
import 'package:sneakcommerce/controller/shipping_controller.dart';
import 'package:provider/single_child_widget.dart';

class AppProviders {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => Controller()),
    ChangeNotifierProvider(create: (_) => ShippingController()),
    ChangeNotifierProvider(create: (_) => PaymentMethodController()),
    ChangeNotifierProvider(create: (_) => AddressController()),
  ];
}
