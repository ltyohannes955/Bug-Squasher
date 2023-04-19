import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:digital_business_card/model/model.dart';

class ApiServiceProvider {
  Future<List?> fetchActivity() async {
    final response = await http.get(
      Uri.parse('https://643659573e4d2b4a12cff409.mockapi.io/donut'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return Model.modelList(json.decode(response.body));
    } else {
      throw Exception('loading failed');
    }
  }
}
