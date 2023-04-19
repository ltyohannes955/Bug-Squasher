import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:digital_business_card/model/cards.dart';

class ApiServiceProvider {
  Future<cards?> fetchActivity() async {
    final response = await http.get(
      Uri.parse('https://www.boredapi.com/api/activity'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      print("/" * 20);
      print(response.body);
      return cards.fromJson(json.decode(response.body)['data']);
    } else {
      throw Exception('Failed to load');
    }
  }
}
