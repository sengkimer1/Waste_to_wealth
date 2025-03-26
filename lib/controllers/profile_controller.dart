
import 'package:waste_to_wealth/models/profile_model.dart';
import 'package:waste_to_wealth/services/api_services.dart';

class ProfileController {
  final ApiService _apiService = ApiService();

  Future<List<ProfileModel>> fetchUserProfile() {
    return _apiService.fetchUserProfile();
  }
}