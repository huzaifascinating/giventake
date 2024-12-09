import 'package:flutter/material.dart';
import '../main.dart';
import 'donor_report.dart';

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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DonorReport(
                        donationDetails: {
                          'title': donation['title']!,
                          'date': donation['date']!,
                          'donorName': 'John Doe', // Dummy data
                          'organization': 'Shelter A', // Dummy data
                          'category': 'Clothing', // Dummy data
                          'additionalInfo':
                              'Provided 100 clothing items.', // Dummy data
                          'itemImages':
                              'https://i0.wp.com/movingtips.wpengine.com/wp-content/uploads/2021/01/donation.jpg?w=1200&ssl=1', // Replace with actual image URL
                          'orgImages':
                              'https://jdcwelfare.org/wp-content/uploads/2023/05/dastarkhuwan-1024x768-1.jpg', // Replace with actual image URL
                          'customMessage':
                              'Thank you for your generous support. Your donation has brought warmth and hope to many.',
                        },
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
