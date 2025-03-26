import 'package:waste_to_wealth/models/activity_model.dart';
import 'package:waste_to_wealth/services/api_services.dart';

class ActivitiesController {
  final ApiService _apiService = ApiService();

    Future<List<Activity>> fetchActivities() async {
    try {
      return await _apiService.fetchActivities();
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}