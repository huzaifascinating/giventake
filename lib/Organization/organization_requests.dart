import 'package:flutter/material.dart';
import 'package:giventake/main.dart'; // Assuming you have this file for main.dart
import 'organization_donationinfo.dart'; // Assuming this is the page to navigate to

class OrganizationRequestsPage extends StatelessWidget {
  const OrganizationRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> requests = [
      {'name': 'Huzaifa', 'request': 'wants to donate food'},
      {'name': 'Ali', 'request': 'wants to donate winter clothes'},
      // More requests can be added here
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Donation Requests'),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 1,
        automaticallyImplyLeading: true, // Back button enabled
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: requests.length,
          itemBuilder: (context, index) {
            final request = requests[index];
            return GestureDetector(
              onTap: () {
                // Navigate to the OrganizationDonationInfoPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        OrganizationDonationInfoPage(request: request),
                  ),
                );
              },
              child: Card(
                margin: const EdgeInsets.only(bottom: 10),
                elevation: 4,
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  leading: const Icon(
                    Icons.volunteer_activism,
                    size: 40,
                    color: darkBlue,
                  ),
                  title: Row(
                    children: [
                      const Icon(
                        Icons.person,
                        size: 20,
                        color: Colors.black,
                      ),
                      const SizedBox(width: 5), // Space between icon and name
                      Text(
                        request['name']!,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  subtitle: Text(
                    request['request']!,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check,
                          size: 16,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.close,
                          size: 16,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: darkBlue,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
