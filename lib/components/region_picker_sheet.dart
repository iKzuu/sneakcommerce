import 'package:flutter/material.dart';
import 'package:sneakcommerce/components/custom_text_field.dart';
import 'package:sneakcommerce/services/region_services.dart';
import 'package:sneakcommerce/theme/app_colors.dart';

class RegionPickerSheet extends StatefulWidget {
  @override
  State<RegionPickerSheet> createState() => _RegionPickerSheetState();
}

class _RegionPickerSheetState extends State<RegionPickerSheet> {
  final service = RegionService();

  String step = "province";

  List data = [];
  List filtered = [];

  dynamic selectedProvince;
  dynamic selectedCity;

  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadProvinces();

    searchController.addListener(() {
      final query = searchController.text.toLowerCase();
      setState(() {
        filtered = data
            .where((e) => e['name'].toLowerCase().contains(query))
            .toList();
      });
    });
  }

  Future<void> loadProvinces() async {
    final res = await service.getProvinces();
    setState(() {
      data = res;
      filtered = res;
    });
  }

  Future<void> loadCities(String id) async {
    final res = await service.getCities(id);
    setState(() {
      step = "city";
      data = res;
      filtered = res;
    });
  }

  Future<void> loadDistricts(String id) async {
    final res = await service.getDistricts(id);
    setState(() {
      step = "district";
      data = res;
      filtered = res;
    });
  }

  String getTitle() {
    switch (step) {
      case "province":
        return "Pilih Provinsi";
      case "city":
        return "Pilih Kota/Kabupaten";
      default:
        return "Pilih Kecamatan";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .85,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Column(
        children: [
          /// HEADER
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                getTitle(),
                style: TextStyle(
                  color: AppColors.onBackground,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),

          /// SEARCH
          CustomTextField(
            controller: searchController,
            hintText: "Search...",
            prefixIcon: Icon(Icons.search_rounded),
          ),

          SizedBox(height: 12),

          /// LIST
          Expanded(
            child: ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (_, i) {
                final item = filtered[i];

                return ListTile(
                  title: Text(item['name']),
                  onTap: () async {
                    if (step == "province") {
                      selectedProvince = item;
                      await loadCities(item['id']);
                    } else if (step == "city") {
                      selectedCity = item;
                      await loadDistricts(item['id']);
                    } else {
                      Navigator.pop(context, {
                        "province": selectedProvince['name'],
                        "city": selectedCity['name'],
                        "district": item['name'],
                      });
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
