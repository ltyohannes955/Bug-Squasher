import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/cat_List.dart';

class ApiServiceProvider {
  Future<List?> fetchActivity() async {
    print("9090");
    final response = await http.get(
      Uri.parse('https://64355258537112453fd32068.mockapi.io/cards'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
    );
    print(response.statusCode);

    if (response.statusCode == 200) {
      return cat_list.itemList(json.decode(response.body));
    } else {
      print("i am hear");
      throw Exception('Failed to load');
    }
  }
  Future<List?> fetchexplor() async {
    print("9090");
    final response = await http.get(
      Uri.parse('https://64355258537112453fd32068.mockapi.io/Explor'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
    );
    print(response.statusCode);

    if (response.statusCode == 200) {
      return cat_list.itemList(json.decode(response.body));
    } else {
      print("i am hear");
      throw Exception('Failed to load');
    }
  }
}
