import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sneakcommerce/models/address.dart';

class AddressController extends ChangeNotifier {
  final Box<Address> _box = Hive.box<Address>('addressBox');

  List<Address> get addressList => _box.values.toList();

  Address? get selectedAddress {
    if (_box.isEmpty) return null;

    return _box.values.firstWhere(
      (a) => a.isSelected,
      orElse: () => _box.values.first,
    );
  }

  void addAddress(Address address) {
    if (_box.isEmpty) {
      address.isSelected = true;
    }
    _box.add(address);
    notifyListeners();
  }

  void selectAddress(Address address) {
    for (var a in _box.values) {
      a.isSelected = false;
      a.save();
    }
    address.isSelected = true;
    address.save();

    notifyListeners();
  }

  void deleteAddress(Address address) {
    final wasSelected = address.isSelected;

    address.delete();

    if (wasSelected && _box.isNotEmpty) {
      final first = _box.values.first;
      first.isSelected = true;
      first.save();
    }

    notifyListeners();
  }

  void updateAddress(Address oldAddress, Address newAddress) {
    final index = oldAddress.key as int;

    final isSelected = oldAddress.isSelected;

    final update = Address(
      id: newAddress.id,
      name: newAddress.name,
      phone: newAddress.phone,
      province: newAddress.province,
      city: newAddress.city,
      district: newAddress.district,
      postalCode: newAddress.postalCode,
      street: newAddress.street,
      detail: newAddress.detail,
      isSelected: isSelected,
    );

    _box.putAt(index, update);

    notifyListeners();
  }
}
