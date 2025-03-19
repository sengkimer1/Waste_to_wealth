import 'package:flutter/material.dart';
import 'package:waste_to_wealth/controllers/user_controller.dart';
import 'package:waste_to_wealth/views/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _profileImageController = TextEditingController();
  final UserController _userController = UserController();

  void _register(BuildContext context) async {
    final email = _emailController.text;
    final password = _passwordController.text;
    final location = _locationController.text;
    final profileImageUrl = _profileImageController.text;

    final success = await _userController.register(email, profileImageUrl, location, password);
    if (success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: const Text('Registration failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/Logo.webp', width: 230),
              const Text(
                'Register',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color(0xF32E553B),
                ),
              ),
              const Text(
                'Create your new account',
                style: TextStyle(fontSize: 18, color: Color(0xF3A1A1A1)),
              ),
              const SizedBox(height: 40),
            Container(
                width: 350,
                
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(
                      color: Color(0xF32E553B),
                      fontSize: 14,
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Color(0xF351BB20), width: 2),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xF32E553B), width: 2),
                    ),
                    labelText: 'Username',
                    prefixIcon: const Icon(Icons.person),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 350,
                
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(
                      color: Color(0xF32E553B),
                      fontSize: 14,
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Color(0xF351BB20), width: 2),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xF32E553B), width: 2),
                    ),
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.email),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Container(
                width: 350,
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(
                      color: Color(0xF32E553B),
                      fontSize: 14,
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Color(0xF351BB20), width: 3),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xF32E553B), width: 2),
                    ),
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Container(
                width: 350,
                child: TextField(
                  controller: _locationController,
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(
                      color: Color(0xF32E553B),
                      fontSize: 14,
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Color(0xF351BB20), width: 3),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xF32E553B), width: 2),
                    ),
                    labelText: 'Location',
                    prefixIcon: const Icon(Icons.location_on),
                  ),
                ),
              ),
              const SizedBox(height: 60),

              Container(
                width: 350,
                child: ElevatedButton(
                  onPressed: () => _register(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xF32E553B),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Sign Up',
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
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      const TextSpan(
                        text: "Already have an account ? ",
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: "Login",
                        style: const TextStyle(
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
      ),
    );
  }
}
