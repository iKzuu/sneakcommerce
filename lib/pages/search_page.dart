import 'package:flutter/material.dart';
import 'package:sneakcommerce/components/search_list_items.dart';
import 'package:sneakcommerce/components/searchbar.dart';
import 'package:sneakcommerce/theme/app_colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        foregroundColor: AppColors.onSurface,
        backgroundColor: AppColors.surface,
        title: Searchbar(controller: _searchController),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      body: SearchListItems(),
    );
  }
}
