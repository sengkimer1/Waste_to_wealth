import 'package:flutter/material.dart';
import 'package:waste_to_wealth/views/editProfile_page.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "User Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Center(
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 120, 120, 120),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Image.asset("assets/Logo.webp"), // Replace with actual image
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Soy Chanleakhena",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.all(30),
            height: 400,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 219, 255, 202),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 15,
              children: const [
                UserInfoRow(label: "First name", value: "SOY"),
                UserInfoRow(label: "Last name", value: "Chanleakhena"),
                UserInfoRow(label: "Email", value: "Chanleakhena@gmail.com"),
                UserInfoRow(label: "Phone Number", value: "1234567987"),
              ],
            ),
          ),
          const SizedBox(height: 20),
         
          const SizedBox(height: 10),
          
       Row(
            mainAxisAlignment: MainAxisAlignment.center, // Align buttons in the center
            children: [
             
              const SizedBox(width: 10), // Space between buttons
              ElevatedButton(
                onPressed: () {
                   Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfilePage()),
                );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4B8F29),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text("Edit"),
              ),
              const SizedBox(width: 10), // Space between buttons
              ElevatedButton(
                onPressed: () {
                  // Add your log out logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB30000),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text("Log Out"),
              ),
            ],
          ),
        ],
    ),
    );
    
  }
}

class UserInfoRow extends StatelessWidget {
  final String label;
  final String value;

  const UserInfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 18, color: Colors.black)),
          Text(
            value,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF2E553B)),
          ),
        ],
      ),
    );
  }
}
