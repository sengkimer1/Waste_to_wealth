import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:waste_to_wealth/models/points_model.dart';
import 'package:waste_to_wealth/models/profile_model.dart';
import 'package:waste_to_wealth/models/reward_model.dart';
import 'package:waste_to_wealth/models/user_model.dart'; // Ensure this import exists
import 'package:waste_to_wealth/models/activity_model.dart'; // Ensure this import exists
import 'package:waste_to_wealth/models/user_model.dart';
import 'package:waste_to_wealth/models/activity_model.dart';
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


   Future<List<Activity>> fetchActivitie({int limit = 20}) async {
    final token = await _storageService.getToken(); // Retrieve token
    if (token == null) {
      throw Exception('Token not found');
    }

    final response = await http.get(
      Uri.parse('$baseUrl/api/account/activity?limit=$limit'),
      headers: {'Authorization': 'Bearer $token'}, // Use token
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Activity.fromJson(json)).take(limit).toList();
    }
    return [];
  }


  Future<List<Activity>> fetchActivities({int limit = 2}) async {
    final token = await _storageService.getToken(); // Retrieve token
    if (token == null) {
      throw Exception('Token not found');
    }

    final response = await http.get(
      Uri.parse('$baseUrl/api/account/activity?limit=$limit'),
      headers: {'Authorization': 'Bearer $token'}, // Use token
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Activity.fromJson(json)).take(limit).toList();
    }
    return [];
  }

Future<List<ProfileModel>> fetchUserProfile() async {
  final token = await _storageService.getToken(); // Retrieve token
  if (token == null) {
    throw Exception('Token not found');
  }

  final response = await http.get(
    Uri.parse('$baseUrl/api/account/user'),
    headers: {'Authorization': 'Bearer $token'}, // Use token
  );

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);

    if (jsonResponse is List) {
      // If response is already a list
      return jsonResponse.map((json) => ProfileModel.fromJson(json)).toList();
    } else if (jsonResponse is Map<String, dynamic>) {
      // If response is an object, convert it into a list with a single element
      return [ProfileModel.fromJson(jsonResponse)];
    } else {
      throw Exception('Unexpected data format');
    }
  } else {
    throw Exception('Failed to load points');
  }
}



Future<List<PointsModel>> fetchPoint() async {
  final token = await _storageService.getToken(); // Retrieve token
  if (token == null) {
    throw Exception('Token not found');
  }

  final response = await http.get(
    Uri.parse('$baseUrl/api/account/points'),
    headers: {'Authorization': 'Bearer $token'}, // Use token
  );

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);

    if (jsonResponse is List) {
      // If response is already a list
      return jsonResponse.map((json) => PointsModel.fromJson(json)).toList();
    } else if (jsonResponse is Map<String, dynamic>) {
      // If response is an object, convert it into a list with a single element
      return [PointsModel.fromJson(jsonResponse)];
    } else {
      throw Exception('Unexpected data format');
    }
  } else {
    throw Exception('Failed to load points');
  }
}


Future<List<RewardModel>> fetchReward() async {
    final token = await _storageService.getToken(); // Retrieve token
    if (token == null) {
      throw Exception('Token not found');
    }

    final response = await http.get(
      Uri.parse('$baseUrl/api/reward/listReward'),
      headers: {'Authorization': 'Bearer $token'}, // Use token
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => RewardModel.fromJson(json)).toList();
    }
    return [];
  }

  // Create new schedule
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
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => PickupModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to create schedule');
    }
  }

  // Fetch pickup history
  Future<List<HistoryModel>> fetchPickup() async {
    final token = await _storageService.getToken();
    if (token == null) {
      throw Exception('Token not found');
    }

    final response = await http.get(
      Uri.parse('$baseUrl/api/pickup/history'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => HistoryModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load pickup history');
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
