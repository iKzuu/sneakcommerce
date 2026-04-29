import 'package:flutter/material.dart';
import 'package:sneakcommerce/components/custom_text_field.dart';
import 'package:sneakcommerce/components/region_picker_sheet.dart';
import 'package:sneakcommerce/theme/app_colors.dart';

class AddressForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController streetController;
  final TextEditingController postalCodeController;
  final TextEditingController detailController;

  final Map<String, dynamic>? region;
  final Function(Map<String, dynamic>) onRegionSelected;

  const AddressForm({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.streetController,
    required this.postalCodeController,
    required this.detailController,
    this.region,
    required this.onRegionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Text(
            "Address",
            style: TextStyle(
              color: AppColors.onSurface,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),

          CustomTextField(controller: nameController, hintText: "Full Name"),

          CustomTextField(
            controller: phoneController,
            hintText: "Phone Number",
          ),

          // Region picker trigger button
          GestureDetector(
            onTap: () async {
              final result = await showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (_) => RegionPickerSheet(),
              );

              if (result != null) {
                onRegionSelected(result);
              }
            },

            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.onSurfaceVariant,
                    width: 0.5,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 20,
                children: [
                  Expanded(
                    child: Text(
                      region == null
                          ? "Province, City, District, Postal Code"
                          : "${region!['province']}, ${region!['city']}, ${region!['district']}",
                      style: TextStyle(
                        color: region == null
                            ? AppColors.onSurfaceVariant
                            : AppColors.onSurface,
                        fontSize: 14,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  Icon(Icons.arrow_forward_ios_rounded, size: 14),
                ],
              ),
            ),
          ),

          CustomTextField(
            controller: streetController,
            hintText: "Street Name, Building, House Number",
          ),

          CustomTextField(
            controller: detailController,
            hintText: "Other address details",
          ),

          CustomTextField(
            controller: postalCodeController,
            hintText: "Postal Code",
          ),
        ],
      ),
    );
  }
}
