import 'package:flutter/material.dart';
import 'login.page.dart';
// import 'home_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
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
            // const SizedBox(height: 10),
            const Text(
              'Create your new account',
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

                  labelText: 'Location',
                  prefixIcon: Icon(Icons.location_on),
                ),
              ),
            ),
            // const SizedBox(height: 20),
          
            const SizedBox(height: 60),
            Container(
              width: 350, // Set the width for the button
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the SignUpPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xF32E553B), 
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ), // Padding inside the button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                ),
                child: const Text(
                  'Sign Up',
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
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
                      style: TextStyle(
                        color:
                            Colors
                                .black,
                      ),
                    ),
                    TextSpan(
                      text: "Login",
                      style: const TextStyle(
                        color: Color(
                         0xF32E553B,
                        ),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
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
