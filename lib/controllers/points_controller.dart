
import 'package:waste_to_wealth/models/points_model.dart';
import 'package:waste_to_wealth/services/api_services.dart';

class PointsController {
  final ApiService _apiService = ApiService();

  Future<List<PointsModel>> fetchPoint() {
    return _apiService.fetchPoint();
  }
}