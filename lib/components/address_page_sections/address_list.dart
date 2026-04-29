import 'package:flutter/material.dart';
import 'package:sneakcommerce/components/address_page_sections/address_card.dart';
import 'package:sneakcommerce/components/bottom_sheets/address_option_sheet.dart';
import 'package:sneakcommerce/models/address.dart';
import 'package:sneakcommerce/pages/add_address_page.dart';
import 'package:sneakcommerce/theme/app_colors.dart';

class AddressList extends StatelessWidget {
  final List<Address> addresses;
  final Address? tempSelected;
  final Function(Address) onSelect;
  const AddressList({
    super.key,
    required this.addresses,
    required this.tempSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 100),
      itemCount: addresses.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final address = addresses[index];

        final isSelected = tempSelected != null
            ? tempSelected == address
            : address.isSelected;

        return AddressCard(
          address: address,
          isSelected: isSelected,
          onTap: () => onSelect(address),

          onEdit: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => AddAddressPage(address: address),
              ),
            );
          },

          onMore: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: AppColors.surface,
              builder: (_) => AddressOptionSheet(address: address),
            );
          },
        );
      },
    );
  }
}
