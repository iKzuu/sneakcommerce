import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakcommerce/controller/address_controller.dart';
import 'package:sneakcommerce/pages/address_page.dart';
import 'package:sneakcommerce/theme/app_colors.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddressController>(
      builder: (context, controller, _) {
        final address = controller.selectedAddress;

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddressPage()),
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: double.infinity,
            decoration: BoxDecoration(color: AppColors.surface),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: address == null
                      ? Column(
                          spacing: 6,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Your shipping address",
                              style: TextStyle(
                                color: AppColors.onSurfaceVariant,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              spacing: 4,
                              children: [
                                Icon(
                                  Icons.location_pin,
                                  color: Colors.lightBlueAccent,
                                ),
                                Expanded(
                                  child: Text(
                                    "Add your address first",
                                    style: TextStyle(
                                      color: AppColors.onSurface,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : Column(
                          spacing: 6,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Your shipping address",
                              style: TextStyle(
                                color: AppColors.onSurfaceVariant,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              spacing: 4,
                              children: [
                                Icon(
                                  Icons.location_pin,
                                  color: Colors.lightBlueAccent,
                                ),
                                Expanded(
                                  child: Text(
                                    "${address.name} | ${address.phone}",
                                    style: TextStyle(
                                      color: AppColors.onSurface,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              address.fullAddress,
                              style: TextStyle(
                                color: AppColors.onSurfaceVariant,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                ),

                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.onSurfaceVariant,
                  size: 18,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
