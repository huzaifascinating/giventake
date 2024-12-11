import 'package:flutter/material.dart';
import 'package:giventake/Donor/donor_personal_information.dart';
import 'package:giventake/Donor/donor_support.dart';

class DonorProfilePage extends StatelessWidget {
  // Dummy data for the donor profile
  final String donorName = "John Doe";
  final String donorEmail = "johndoe@example.com";

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> profileOptions = [
      {
        'icon': Icons.info,
        'title': 'Personal Information',
        'color': Colors.blue,
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DonorPersonalInfoPage(),
            ),
          );
        },
      },
      {
        'icon': Icons.help,
        'title': 'Help & Support',
        'color': Colors.blue,
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HelpSupportPage(),
            ),
          );
        },
      },
      {
        'icon': Icons.logout,
        'title': 'Logout',
        'color': Colors.red,
        'onTap': () {
          Navigator.pop(context); // For now, navigate back
        },
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Profile Icon
            const Center(
              child: Icon(
                Icons.account_circle,
                size: 120,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 5),

            // Donor Name
            Center(
              child: Text(
                donorName,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 5),

            // Donor Email
            Center(
              child: Text(
                donorEmail,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 35),

            // Profile Options
            ...profileOptions.map(
              (option) {
                return Column(
                  children: [
                    ListTile(
                      leading: Icon(option['icon'], color: option['color']),
                      title: Text(option['title']),
                      trailing: const Icon(Icons.arrow_forward_ios,
                          color: Colors.black),
                      onTap: option['onTap'],
                    ),
                    const Divider(color: Colors.grey),
                  ],
                );
              },
            ).toList(),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DonorProfilePage(),
  ));
}
