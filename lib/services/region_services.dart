import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class RegionService {
  final String baseUrl = dotenv.env['BASE_URL']!;

  Future<List<dynamic>> getProvinces() async {
    final res = await http.get(Uri.parse("$baseUrl/provinces.json"));
    return json.decode(res.body);
  }

  Future<List<dynamic>> getCities(String provinceId) async {
    final res =
        await http.get(Uri.parse("$baseUrl/regencies/$provinceId.json"));
    return json.decode(res.body);
  }

  Future<List<dynamic>> getDistricts(String cityId) async {
    final res =
        await http.get(Uri.parse("$baseUrl/districts/$cityId.json"));
    return json.decode(res.body);
  }
}