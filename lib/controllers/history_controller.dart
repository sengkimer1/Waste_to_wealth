import 'package:flutter/material.dart';
import 'package:waste_to_wealth/models/history_model.dart';
import 'package:waste_to_wealth/services/api_services.dart';  // Import the ApiService

class HistoryController {
  final ApiService _apiService = ApiService();

  // Fetch Pickup data using the ApiService
  Future<List<HistoryModel>> fetchPickup() async {
    try {
      return await _apiService.fetchPickup();
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
   // Cancel Pickup
  Future<bool> cancelPickup(int pickupId) async {
    try {
      return await _apiService.cancelPickup(pickupId);
    } catch (e) {
      return false; // Return false if API call fails
    }
  }
}