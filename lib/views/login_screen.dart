import 'package:flutter/material.dart';
import 'package:waste_to_wealth/components/main_screen.dart';
import 'signup_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waste_to_wealth/controllers/user_controller.dart';
import 'package:waste_to_wealth/bloc/user_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final UserController _userController = UserController();

  @override
  void initState() {
    super.initState();
    _checkToken(); // Check if user is already logged in when the screen is initialized
  }

  void _checkToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token'); // Get the token, which is nullable

    if (token != null && token.isNotEmpty) {
      // If token exists and is not empty, navigate to the MainScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    }
  }
void _login() async {
  final email = _emailController.text;
  final password = _passwordController.text;
  final userBloc = BlocProvider.of<UserBloc>(context);

  final user = await _userController.login(email, password, userBloc);
  if (user != null) {
    final token = user.token ?? ''; // Use an empty string if token is null

    // Save the token to SharedPreferences upon successful login
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token); // Now token is non-null

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainScreen()),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Login failed')),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/Logo.webp', width: 300),
            const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Color(0xF32E553B),
              ),
            ),
            const Text(
              'Login to your account',
              style: TextStyle(fontSize: 18, color: Color(0xF3A1A1A1)),
            ),
            const SizedBox(height: 40),
            Container(
              width: 350,
              child: TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelStyle: TextStyle(
                    color: Color(0xF32E553B),
                    fontSize: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Color(0xF351BB20), width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xF32E553B), width: 2),
                  ),
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 350,
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelStyle: TextStyle(
                    color: Color(0xF32E553B),
                    fontSize: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Color(0xF351BB20), width: 3),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xF32E553B), width: 2),
                  ),
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
            ),
            Container(
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.check, color: Color(0xF351BB20)),
                      const Text(
                        'Remember Me',
                        style: TextStyle(color: Color(0xF3A1A1A1)),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Color(0xF32E553B),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Container(
              width: 350,
              child: ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xF32E553B),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  RegisterScreen()),
                );
              },
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Don't have an account ? ",
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: "Sign Up",
                      style: TextStyle(
                        color: Color(0xF32E553B),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
