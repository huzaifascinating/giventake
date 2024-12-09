import 'package:flutter/material.dart';
import 'package:giventake/Donor/donor_personal_information.dart';
import 'package:giventake/Donor/donor_support.dart';

class DonorProfilePage extends StatelessWidget {
  // Dummy data for the donor profile
  final String donorName = "John Doe";
  final String donorEmail = "johndoe@example.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 20), // Spacing below AppBar
          // Profile picture and name
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.blue.shade100,
            child: const Icon(
              Icons.person,
              size: 60,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            donorName,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            donorEmail,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 30), // Spacing before options
          // Profile options
          _buildOption(
            icon: Icons.info,
            title: "Personal Information",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PersonalInformationForm()));
            },
          ),
          // _buildOption(
          //   icon: Icons.settings,
          //   title: "Settings",
          //   onTap: () {
          //     // Handle Settings action
          //   },
          // ),
          _buildOption(
            icon: Icons.help,
            title: "Help & Support",
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HelpSupportPage()));
            },
          ),
          const Spacer(), // Push the logout button to the bottom
          _buildOption(
            icon: Icons.logout,
            title: "Logout",
            onTap: () {
              // Handle Logout action
              Navigator.pop(context); // For now, navigate back
            },
            textColor: Colors.red,
            iconColor: Colors.red,
          ),
          const SizedBox(height: 20), // Spacing at the bottom
        ],
      ),
    );
  }

  Widget _buildOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color textColor = Colors.black,
    Color iconColor = Colors.black,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: iconColor,
        size: 28,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DonorProfilePage(),
  ));
}
