import 'package:waste_to_wealth/models/activity_model.dart';
import 'package:waste_to_wealth/models/reward_model.dart';
import 'package:waste_to_wealth/services/api_services.dart';

class RewardController {
  final ApiService _apiService = ApiService();

  Future<List<RewardModel>> fetchReward() {
    return _apiService.fetchReward();
  }
}