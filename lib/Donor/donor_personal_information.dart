import 'package:flutter/material.dart';

class DonorPersonalInfoPage extends StatelessWidget {
  // Dummy data for the initial fields
  final String name = "John Doe";
  final String email = "johndoe@example.com";
  final String phoneNumber = "+1234567890";
  final String location = "123 Main Street, Springfield";
  final String dob = "01 January 1990";

  @override
  Widget build(BuildContext context) {
    // Placeholder data array with icons added
    final List<Map<String, dynamic>> donorInfo = [
      {'label': 'Email', 'value': email, 'icon': Icons.email},
      {'label': 'Phone Number', 'value': phoneNumber, 'icon': Icons.phone},
      {'label': 'Location', 'value': location, 'icon': Icons.location_on},
      {'label': 'Date of Birth', 'value': dob, 'icon': Icons.cake},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: const Text(
          'Personal Information',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.white, // Set background color to white
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Donor icon, Name, and Email in a row
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Donor icon
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.blueAccent,
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Donor name
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Email
                    Row(
                      children: [
                        Icon(
                          donorInfo[0]['icon'], // Email icon
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          donorInfo[0]
                              ['value']!, // Accessing email from the array
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            // List of other information with icons and horizontal dividers
            for (var i = 1; i < donorInfo.length; i++)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Icon(
                          donorInfo[i]['icon'],
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          donorInfo[i]['label']!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    donorInfo[i]['value']!,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black54,
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
