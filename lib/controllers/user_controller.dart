import 'package:waste_to_wealth/bloc/user_bloc.dart';
import 'package:waste_to_wealth/models/user_model.dart';
import 'package:waste_to_wealth/services/api_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserController {
  final ApiService _apiService = ApiService();

  Future<User?> login(String username, String password, [UserBloc? userBloc]) async { // Made UserBloc optional
    final user = await _apiService.login(username, password);
    if (user != null && userBloc != null) { // Null check for userBloc
      userBloc.add(SetUserEvent(user)); // Dispatch user event to bloc
    }
    return user;
  }

  Future<bool> register(String email, String profileImageUrl, String username, String password) async {
    final user = User(
      email: email,
      profileImageUrl: profileImageUrl,
      userName: username,
      password: password,
    );
    return await _apiService.register(user);
  }
}