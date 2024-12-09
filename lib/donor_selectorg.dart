import 'package:flutter/material.dart';
import 'donor_validation.dart'; // Import DonorValidation page

class DonorSelector extends StatelessWidget {
  const DonorSelector({super.key});

  @override
  Widget build(BuildContext context) {
    // Example list of organizations
    final List<Map<String, String>> organizations = [
      {
        'name': 'Saylani',
        'icon': 'assets/saylani.png',
        'location': 'Nearest: 6km'
      },
      {'name': 'JDC', 'icon': 'assets/jdc.png', 'location': 'Nearest: 8km'},
      {'name': 'Edhi', 'icon': 'assets/edhi.png', 'location': 'Nearest: 10km'},
      {
        'name': 'Chipa',
        'icon': 'assets/chippa.png',
        'location': 'Nearest: 7km'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select Organization',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 2,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: organizations.length,
        itemBuilder: (context, index) {
          final organization = organizations[index];
          return Card(
            elevation: 6,
            margin: const EdgeInsets.only(bottom: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // Organization Icon
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          organization['icon']!,
                          width: 55,
                          height: 55,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 16.0),

                      // Organization Name and Location
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              organization['name']!,
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  size: 16.0,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 4.0),
                                Text(
                                  organization['location']!,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // More Info Button
                      TextButton.icon(
                        onPressed: () {
                          // Info button action
                        },
                        icon: const Icon(
                          Icons.info,
                          color: Colors.blue,
                        ),
                        label: const Text(
                          'More Info',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),

                  // Select Button (New Line, Full Width)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {
                        // Show confirmation dialog before navigating
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                  'Select ${organization['name']}'), // Dynamic title
                              content: const Text(
                                'Are you sure you want to select this organization?',
                                style: TextStyle(
                                    color: Colors.black), // Black text color
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    // Close the dialog
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(
                                        color: Colors.black), // Black text
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // Navigate to the DonorValidationPage
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DonorValidationPage(
                                          organizationName:
                                              organization['name']!,
                                          organizationIcon:
                                              organization['icon']!,
                                        ),
                                      ),
                                    );
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor:
                                        Colors.blue, // Blue background
                                  ),
                                  child: const Text(
                                    'Confirm',
                                    style: TextStyle(
                                      color: Colors.white, // White text color
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon:
                          const Icon(Icons.arrow_forward, color: Colors.white),
                      label: const Text('Select'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
