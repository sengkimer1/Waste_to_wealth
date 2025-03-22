import 'package:flutter/material.dart';
import 'package:waste_to_wealth/views/profile_screen.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading: GestureDetector(
        //   onTap: () {},
        //   child: Container(
        //     margin: EdgeInsets.only(left: 10),
        //     alignment: Alignment.center,
        //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        //     child: IconButton(
        //       icon: Icon(Icons.arrow_back, color: Colors.black),
        //       onPressed: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(builder: (context) => ProfileScreen()),
        //         );
        //       },
        //     ),
        //   ),
        // ),
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(  // Make sure content is scrollable in case it's too long
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),

              // Profile Picture with Shadow
              Center(
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: const Offset(0, 8),
                        blurRadius: 15,
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      "assets/Logo.webp", // Replace with actual image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Name Display
              const Text(
                "Soy Chanleakhena",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),

              // First Name Label & TextField
              _buildTextField("First Name", "Soy"),

              const SizedBox(height: 20),

              // Last Name Label & TextField
              _buildTextField("Last Name", "Chanleakhena"),

              const SizedBox(height: 20),

              // Email Label & TextField
              _buildTextField("Email", "chanleakhena.soy@institute.pse.ngo"),

              const SizedBox(height: 20),

              // Phone Number Label & TextField
              _buildTextField("Phone Number", "01234567"),

              const SizedBox(height: 30),

              // Save Button
              ElevatedButton(
                onPressed: () {
                  // Add your save logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2E553B),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    
                  ),
                ),
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build labeled text fields
  Widget _buildTextField(String label, String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              labelText: hint,
              labelStyle: const TextStyle(
                color: Color(0xFF2E553B),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.green, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xFF2E553B),
                  width: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
