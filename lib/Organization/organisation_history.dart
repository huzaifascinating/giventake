import 'package:flutter/material.dart';
import 'package:giventake/main.dart'; // Assuming `darkBlue` is defined here.

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for donations
    final List<Map<String, dynamic>> donations = [
      {
        'donation_name': 'Food Package',
        'donor_name': 'John Doe',
        'date': '2024-12-01',
        'icon': Icons.fastfood,
      },
      {
        'donation_name': 'Clothing Drive',
        'donor_name': 'Jane Smith',
        'date': '2024-11-28',
        'icon': Icons.checkroom,
      },
      {
        'donation_name': 'Toys for Children',
        'donor_name': 'Alice Cooper',
        'date': '2024-11-15',
        'icon': Icons.toys,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: secondaryColor),
        centerTitle: true,
        title: const Text(
          'History',
          style: TextStyle(color: secondaryColor),
        ),
        leading: IconButton(
          icon: const Icon(Icons.search, color: secondaryColor),
          onPressed: () {
            // Implement search functionality
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: donations.length,
          itemBuilder: (context, index) {
            final donation = donations[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: const Icon(Icons.favorite,
                    size: 40, color: lightBlue), // Fixed donation icon
                title: Text(
                  donation['donation_name'],
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Donor: ${donation['donor_name']}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Date: ${donation['date']}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: secondaryColor,
                  size: 20,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
