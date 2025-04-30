// lib/services/api_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  // Change this to your Django backend URL
  static const String baseUrl =
      'http://10.0.2.2:8000/api'; // For Android emulator
  // static const String baseUrl = 'http://localhost:8000/api';  // For iOS simulator

  // Save session ID/cookie
  static Future<void> saveSessionCookie(http.Response response) async {
    String? rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('sessionCookie', rawCookie);
    }
  }

  // Get stored session cookie for subsequent requests
  static Future<Map<String, String>> getHeaders() async {
    final prefs = await SharedPreferences.getInstance();
    String? cookie = prefs.getString('sessionCookie');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    if (cookie != null) {
      headers['cookie'] = cookie;
    }

    return headers;
  }

  // Login function to call Django login endpoint
  static Future<bool> login(String username, String password) async {
    try {
      // Get CSRF token first
      await http.get(Uri.parse('$baseUrl/csrf/'));

      // Make login request
      final response = await http.post(
        Uri.parse('$baseUrl/login/'),
        headers: await getHeaders(),
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        await saveSessionCookie(response);
        return true;
      }
      return false;
    } catch (e) {
      print('Login error: $e');
      return false;
    }
  }

  // Check if user is authenticated
  static Future<bool> isAuthenticated() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/user/'),
        headers: await getHeaders(),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['isAuthenticated'] == true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  // Logout
  static Future<bool> logout() async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/logout/'),
        headers: await getHeaders(),
      );

      if (response.statusCode == 200) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.remove('sessionCookie');
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  // Get waste categories
  static Future<List<dynamic>> getWasteCategories() async {
    final response = await http.get(
      Uri.parse('$baseUrl/waste/categories/'),
      headers: await getHeaders(),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load waste categories');
    }
  }

  // Get collection requests
  static Future<List<dynamic>> getCollectionRequests() async {
    final response = await http.get(
      Uri.parse('$baseUrl/collection/requests/'),
      headers: await getHeaders(),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load collection requests');
    }
  }

  // Create collection request
  static Future<Map<String, dynamic>> createCollectionRequest(
      Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/collection/requests/'),
      headers: await getHeaders(),
      body: jsonEncode(data),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to create collection request');
    }
  }
}
