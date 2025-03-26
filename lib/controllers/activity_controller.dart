
import 'package:waste_to_wealth/models/activity_model.dart';
import 'package:waste_to_wealth/services/api_services.dart';

class ActivityController {
  final ApiService _apiService = ApiService();

  Future<List<Activity>> fetchActivitie() {
    return _apiService.fetchActivitie();
  }
}