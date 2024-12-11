import 'package:flutter/material.dart';
import 'package:giventake/main.dart';
import 'organisation_login.dart';
import 'organization_personalinfo.dart';
import 'organization_reports.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> profileOptions = [
      {
        'icon': Icons.upload_file,
        'title': 'Upload Document',
        'color': Colors.blue,
        'onTap': () {
          // Implement document upload functionality
        }
      },
      {
        'icon': Icons.person,
        'title': 'Personal Info',
        'color': Colors.blue,
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const OrganizationPersonalInfoPage()),
          );
        }
      },
      {
        'icon': Icons.trending_up,
        'title': 'Impact Reports',
        'color': Colors.blue,
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ImpactReportPage()),
          );
        }
      },
      {
        'icon': Icons.exit_to_app,
        'title': 'Logout',
        'color': Colors.red,
        'onTap': () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const OrganizationLogin()),
          );
        }
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

            const Center(
              child: Text(
                'Saylani International Welfare Foundation',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 35),

            ...profileOptions.map(
              (option) {
                return Column(
                  children: [
                    ListTile(
                      leading: Icon(option['icon'], color: option['color']),
                      title: Text(option['title']),
                      trailing:
                          const Icon(Icons.arrow_forward_ios, color: darkBlue),
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
