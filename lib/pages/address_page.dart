import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/components/address_page_sections/address_list.dart';
import 'package:sneakcommerce/controller/address_controller.dart';
import 'package:sneakcommerce/models/address.dart';
import 'package:sneakcommerce/pages/add_address_page.dart';
import 'package:sneakcommerce/theme/app_colors.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  Address? tempSelected;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final controller = context.read<AddressController>();
    tempSelected ??= controller.selectedAddress;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        title: Text("Address", style: TextStyle(color: AppColors.onSurface)),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddAddressPage()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Text(
                "Add Address",
                style: TextStyle(
                  color: AppColors.onSurface,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      body: Consumer<AddressController>(
        builder: (context, controller, _) {
          final addresses = controller.addressList;

          if (addresses.isEmpty) {
            return Center(
              child: Text(
                "No address found",
                style: TextStyle(
                  color: AppColors.onSurface,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }

          return AddressList(
            addresses: addresses,
            tempSelected: tempSelected,
            onSelect: (address) {
              setState(() {
                tempSelected = address;
              });
            },
          );
        },
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {
              if (tempSelected == null) return;

              context.read<AddressController>().selectAddress(tempSelected!);

              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              backgroundColor: AppColors.onBackground,
              shadowColor: AppColors.onSurfaceVariant,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(4),
              ),
            ),
            child: Text(
              "Choose Address",
              style: TextStyle(
                color: AppColors.surface,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
