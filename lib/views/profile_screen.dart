import 'package:flutter/material.dart';
import 'package:waste_to_wealth/controllers/profile_controller.dart';
import 'package:waste_to_wealth/models/profile_model.dart';
import 'package:waste_to_wealth/views/editProfile_page.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController _profileController = ProfileController();
  late Future<List<ProfileModel>> _profile;

  @override
  void initState() {
    super.initState();
    _profile = _profileController.fetchUserProfile();
  }

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
      body: FutureBuilder<List<ProfileModel>>(
        future: _profile, // Now expects a List<ProfileModel>
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available.'));
          }

          final user = snapshot.data!.first; // Get first profile from the list

          return Column(
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      user.profileImageUrl, // Dynamically load image
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null)
                          return child; // Show image once loaded
                        return const Center(
                          child: CircularProgressIndicator(),
                        ); // Show loader while loading
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.white,
                        ); // Default icon if image fails
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                user.userName, // Dynamically fetch name
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(30),
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 219, 255, 202),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    UserInfoRow(label: "Full Name", value: user.userName),
                    UserInfoRow(label: "Email", value: user.email),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Align buttons in the center
                children: [
                  const SizedBox(width: 10), // Space between buttons
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfilePage(),
                        ),
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
          );
        },
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
          Text(
            label,
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2E553B),
            ),
          ),
        ],
      ),
    );
  }
}
