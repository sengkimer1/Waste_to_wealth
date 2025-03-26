import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:waste_to_wealth/models/user_model.dart';
import 'package:waste_to_wealth/services/strong_services.dart';
import 'package:waste_to_wealth/models/pickup_model.dart';
import 'package:waste_to_wealth/models/history_model.dart';

class ApiService {
  static const String baseUrl = 'https://pay1.jetdev.life';
  final StorageService _storageService = StorageService();

  // Login method
  Future<User?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/account/login'),
      body: jsonEncode({'username': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final user = User.fromJson(jsonDecode(response.body));
      if (user.token != null) {
        await _storageService.saveToken(user.token!);
      }
      return user;
    }
    return null;
  }

  // Registration method
  Future<bool> register(User user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/account/register'),
      body: jsonEncode(user.toJson()),
      headers: {'Content-Type': 'application/json'},
    );
    return response.statusCode == 200;
  }

  // Post a new pickup schedule
  Future<List<PickupModel>> createNewSchedule({
    int limit = 20,
    required String userId,
    required String date,
    required List<String> wasteTypes,
    required double estimateWeight,
    required bool recurring,
  }) async {
    final token = await _storageService.getToken();
    if (token == null) {
      throw Exception('Token not found');
    }

    final requestBody = {
      "userId": userId,
      "date": date,
      "wasteTypes": wasteTypes.isNotEmpty ? wasteTypes : [],
      "estimateWeight": estimateWeight,
      "recurring": recurring,
    };

    final response = await http.post(
      Uri.parse('$baseUrl/api/pickup/schedule?limit=$limit'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);

      if (decodedData is List) {
        return decodedData.map((json) => PickupModel.fromJson(json)).toList();
      } else if (decodedData is Map<String, dynamic>) {
        return [PickupModel.fromJson(decodedData)];
      } else {
        throw Exception('Unexpected response format');
      }
    } else {
      throw Exception('Failed to create schedule');
    }
  }

  // Fetch Pickup history from the API
  Future<List<HistoryModel>> fetchPickup() async {
    final token = await _storageService.getToken();
    if (token == null) {
      throw Exception('Token not found');
    }

    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/pickup/history'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((item) => HistoryModel.fromJson(item)).toList();
      } else {
        throw Exception("Failed to load pickup history");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  // Cancel a pickup
  Future<bool> cancelPickup(int pickupId) async {
    final token = await _storageService.getToken();
    if (token == null) {
      throw Exception('Token not found');
    }

    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/api/pickup/cancel/$pickupId'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      throw Exception('Failed to cancel pickup: $error');
    }
  }
}
