import 'package:flutter/material.dart';
import 'package:waste_to_wealth/models/pickup_model.dart';
import 'package:waste_to_wealth/services/api_services.dart';  // Import the ApiService

class PickupController {
  final ApiService _apiService = ApiService();

  // // Fetch Pickup data using the ApiService
  // Future<List<PickupModel>> fetchPickup() async {
  //   try {
  //     return await _apiService.fetchPickup();
  //   } catch (e) {
  //     throw Exception("Error: $e");
  //   }
  // }


  Future<List<PickupModel>> createNewSchedule({
    required String userId,
    required String date,
    required List<String> wasteTypes,
    required double estimateWeight,
    required bool recurring,
  }) async {
    return await _apiService.createNewSchedule(
      userId: userId,
      date: date,
      wasteTypes: wasteTypes.isNotEmpty ? wasteTypes : [],
      estimateWeight: estimateWeight,
      recurring: recurring,
    );
  }

}
