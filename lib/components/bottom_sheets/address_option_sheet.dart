import 'package:flutter/material.dart';
import 'package:sneakcommerce/controller/address_controller.dart';
import 'package:sneakcommerce/models/address.dart';
import 'package:sneakcommerce/theme/app_colors.dart';
import 'package:sneakcommerce/utils/dialog_utils.dart';
import 'package:provider/provider.dart';

class AddressOptionSheet extends StatelessWidget {
  final Address address;
  const AddressOptionSheet({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.delete, color: AppColors.onSurface, size: 20),
              title: Text(
                "Delete Address",
                style: TextStyle(
                  color: AppColors.onSurface,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                DialogUtils.showConfirmDialog(
                  context: context,
                  title: "Delete Address",
                  content: "Are you sure you want to delete this address?",
                  onConfirm: () {
                    Navigator.pop(context);

                    context.read<AddressController>().deleteAddress(address);

                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("Address deleted")));
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
