import 'package:flutter/material.dart';
import 'package:sneakcommerce/components/add_address_page_sections/address_form.dart';
import 'package:sneakcommerce/controller/address_controller.dart';
import 'package:sneakcommerce/models/address.dart';
import 'package:sneakcommerce/theme/app_colors.dart';
import 'package:sneakcommerce/utils/dialog_utils.dart';
import 'package:provider/provider.dart';

class AddAddressPage extends StatefulWidget {
  final Address? address;
  const AddAddressPage({super.key, this.address});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final streetController = TextEditingController();
  final detailController = TextEditingController();
  final postalCodeController = TextEditingController();

  Map<String, dynamic>? region;

  bool validateForm() {
    if (nameController.text.isEmpty) {
      DialogUtils.showInfoDialog(context, "Oops", "Nama belum diisi");
      return false;
    }

    if (phoneController.text.isEmpty) {
      DialogUtils.showInfoDialog(context, "Oops", "Nomor HP belum diisi");
      return false;
    }

    if (region == null) {
      DialogUtils.showInfoDialog(context, "Oops", "Pilih wilayah dulu");
      return false;
    }

    if (streetController.text.isEmpty) {
      DialogUtils.showInfoDialog(context, "Oops", "Alamat belum diisi");
      return false;
    }

    return true;
  }

  @override
  void initState() {
    super.initState();

    if (widget.address != null) {
      final a = widget.address!;

      nameController.text = a.name;
      phoneController.text = a.phone;
      streetController.text = a.street;
      detailController.text = a.detail;
      postalCodeController.text = a.postalCode;

      region = {"province": a.province, "city": a.city, "district": a.district};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.background,
      appBar: AppBar(
        foregroundColor: AppColors.onSurface,
        backgroundColor: AppColors.surface,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        title: Text(
          "Add Address",
          style: TextStyle(color: AppColors.onSurface),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            AddressForm(
              nameController: nameController,
              phoneController: phoneController,
              streetController: streetController,
              postalCodeController: postalCodeController,
              detailController: detailController,
              region: region,
              onRegionSelected: (value) {
                setState(() {
                  region = value;
                });
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {
              if (!validateForm()) return;

              final controller = context.read<AddressController>();

              final newAddress = Address(
                id: widget.address?.id ?? DateTime.now().toString(),
                name: nameController.text,
                phone: phoneController.text,
                province: region!['province'],
                city: region!['city'],
                district: region!['district'],
                postalCode: postalCodeController.text,
                street: streetController.text,
                detail: detailController.text,
                isSelected: widget.address?.isSelected ?? false,
              );

              if (widget.address == null) {
                controller.addAddress(newAddress);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Address was succesfully added")),
                );
              } else {
                controller.updateAddress(widget.address!, newAddress);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Address has been successfully updated"),
                  ),
                );
              }

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
              widget.address == null ? "Save Address" : "Update Address",
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
