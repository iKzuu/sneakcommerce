import 'package:flutter/material.dart';
import 'package:sneakcommerce/data/payment_method_data.dart';
import 'package:sneakcommerce/models/payment_method.dart';

class PaymentMethodController extends ChangeNotifier {
  List<PaymentMethod> get paymentMethodList => paymentMethods;

  PaymentMethod? _selectedPaymentMethod;
  PaymentMethod? get selectedPaymentMethod => _selectedPaymentMethod;

  PaymentMethodController() {
    _selectedPaymentMethod =
        paymentMethods.isNotEmpty ? paymentMethods.first : null;
  }

  void selectPaymentMethod(PaymentMethod method) {
    _selectedPaymentMethod = method;
    notifyListeners();
  }
}