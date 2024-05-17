import 'dart:convert';

import 'model.dart';
import 'package:http/http.dart' as http;

class ApiHandler {
  final String baseUri = "http://localhost:64471/api/Employees/GetAllEmployees";
  Future<List<Employee>> getUserData() async {
    List<Employee> data = [];

    final uri = Uri.parse(baseUri);
    try {
      final response = await http.get(uri, headers: <String, String>{
        'Content-type': 'application/json; charset = UTF-8'
      });
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        final List<dynamic> jsonData = json.decode(response.body);
        data = jsonData.map((json) => Employee.fromJson(json)).toList();
      }
    } catch (e) {
      return data;
    }
    return data;
  }
}
