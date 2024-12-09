import 'package:flutter/material.dart';
import 'main.dart';

class DonationHistoryScreen extends StatelessWidget {
  final List<Map<String, String>> donations = [
    {'title': 'Donation to Shelter A', 'date': 'Dec 1, 2024'},
    {'title': 'Food for Orphanage B', 'date': 'Nov 25, 2024'},
    {'title': 'Clothes for Shelter C', 'date': 'Nov 15, 2024'},
  ];

  DonationHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: donations.length,
          itemBuilder: (context, index) {
            final donation = donations[index];
            return Card(
              color: primaryColor,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const Icon(Icons.volunteer_activism, color: lightBlue),
                title: Text(
                  donation['title']!,
                  style: const TextStyle(
                    color: secondaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  donation['date']!,
                  style: const TextStyle(color: secondaryColor),
                ),
                trailing: const Icon(Icons.arrow_forward, color: darkBlue),
                onTap: () {
                  // Add navigation or actions here
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
