import 'package:flutter/material.dart';

class DonorSelector extends StatelessWidget {
  const DonorSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Example list of organizations
    final List<Map<String, String>> organizations = [
      {'name': 'Saylani', 'icon': 'assets/saylani.png', 'location': 'Nearest: 6km'},
      {'name': 'JDC', 'icon': 'assets/jdc.png', 'location': 'Nearest: 8km'},
      {'name': 'Edhi', 'icon': 'assets/edhi.png', 'location': 'Nearest: 10km'},
      {'name': 'Edhi', 'icon': 'assets/edhi.png', 'location': 'Nearest: 10km'},
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
              child: Row(
                children: [
                  // Organization Icon
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      organization['icon']!,
                      width: 60,
                      height: 60,
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
                        Text(
                          organization['location']!,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Buttons in a Row
                  Row(
                    children: [
                      TextButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onPressed: () {
                          // Info button action
                        },
                        child: const Text(
                          'More Info',
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onPressed: () {
                          // Select button action
                        },
                        child: const Text('Select'),
                      ),
                    ],
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
