
import 'dart:convert';
import 'package:cue_swap/services/local_storage.dart';
import 'package:http/http.dart' as http;

class SwapCUEApi {
  static const String baseUrl = 'https://18.224.16.168';


  static Future<dynamic> get(String path) async {
    try {
      final url = Uri.parse('$baseUrl/$path');
      final token = LocalStorage.prefs.getString('token');
      final authHeader = token != null && token.isNotEmpty ? 'Bearer $token' : '';
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': authHeader,
        'Accept': '*/*'
      };
      final response = await http.get(url, headers: headers);
      if (response.statusCode >= 200 && response.statusCode < 500) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  static Future<dynamic> post(String path, Map<String, dynamic> data) async {
    try {
      final url = Uri.parse('$baseUrl/$path');
      final token = LocalStorage.prefs.getString('token');
      final authHeader = token != null && token.isNotEmpty ? 'Bearer $token' : '';
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': authHeader
      };
      
      final body = jsonEncode(data);
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode >= 200 && response.statusCode < 500) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  static Future<dynamic> put(String path, Map<String, dynamic> data) async {
    try {
      final url = Uri.https('$baseUrl/$path');
      final token = LocalStorage.prefs.getString('token');
      final authHeader = token != null && token.isNotEmpty ? 'Bearer $token' : '';
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': authHeader,
        'Accept': '*/*'
      };
      final body = jsonEncode(data);
      final response = await http.put(url, headers: headers, body: body);

      if (response.statusCode >= 200 && response.statusCode < 500) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  static Future<dynamic> delete(String path, Map<String, dynamic> data) async {
    try {
      final url = Uri.parse('$baseUrl/$path');
      final token = LocalStorage.prefs.getString('token');
      final authHeader = token != null && token.isNotEmpty ? 'Bearer $token' : '';
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': authHeader,
        'Accept': '*/*'
      };
      final body = jsonEncode(data);
      final response = await http.delete(url, headers: headers, body: body);

      if (response.statusCode >= 200 && response.statusCode < 500) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
