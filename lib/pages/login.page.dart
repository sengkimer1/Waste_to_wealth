import 'package:flutter/material.dart';
import 'signup.page.dart';
// import 'home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/splash.webp', width: 300),
            const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Color(0xF32E553B),
              ),
            ),
            // const SizedBox(height: 10),
            const Text(
              'Login to your account',
              style: TextStyle(fontSize: 18, color: Color(0xF3A1A1A1)),
            ),
            const SizedBox(height: 40),

            Container(
              width: 350,
              child: const TextField(
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
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ),
            const SizedBox(height: 20),

            Container(
              width: 350,
              child: const TextField(
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
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
            ),
            // const SizedBox(height: 20),
            Container(
              width: 350, // Set the width for the row container
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Remember Me Checkbox
                  Row(
                    children: [
                      const Icon(
                        Icons.check,
                        color: Color(0xF351BB20),
                      ), // You can set a value or callback here
                      const Text(
                        'Remember Me',
                        style: TextStyle(color: Color(0xF3A1A1A1)),
                      ),
                    ],
                  ),
                  // Forgot Password Text
                  TextButton(
                    onPressed: () {
                      // Handle forgot password action here
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: Color(0xF32E553B)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 350, // Set the width for the button
              child: ElevatedButton(
               onPressed: () {
                  // Navigate to the SignUpPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xF32E553B), // Button color
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ), // Padding inside the button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white, // Text color
                    fontSize: 15, // Text size
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            TextButton(
                onPressed: () {
                  // Navigate to the SignUpPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpPage()),
                  );
                },
                child: const Text(
                  "Don't have an account? Sign Up",
                  style: TextStyle(
                    color: Color(0xF32E553B),
                    fontSize: 16,
                  ),
                ),
              ),
            // ElevatedButton (You can uncomment and use this)
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.pushReplacement(
            //       context,
            //       MaterialPageRoute(builder: (context) => const HomePage()),
            //     );
            //   },
            //   child: const Text('Login'),
            // ),
          ],
        ),
      ),
    );
  }
}
