import 'package:flutter/material.dart';
import 'package:sneakcommerce/components/search_item.dart';
import 'package:sneakcommerce/components/searchbar.dart';

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
      backgroundColor: Color(0xFFC9BCAF),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF435150),
        title: Searchbar(controller: _searchController),
      ),
      body: SearchItem(),
    );
  }
}
