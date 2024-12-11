import 'package:flutter/material.dart';

class OrganizationPersonalInfoPage extends StatelessWidget {
  const OrganizationPersonalInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder data array with icons added
    final List<Map<String, dynamic>> orgInfo = [
      {
        'label': 'Organization Name',
        'value': 'Saylani Welfare',
        'icon': Icons.business
      },
      {
        'label': 'Email',
        'value': 'saylani.org@example.com',
        'icon': Icons.email
      },
      {'label': 'Logo', 'value': 'assets/saylani.png', 'icon': Icons.image},
      {
        'label': 'Registration/License Number',
        'value': '123456789',
        'icon': Icons.credit_card
      },
      {
        'label': 'Type of Organization',
        'value': 'Non-Profit',
        'icon': Icons.account_balance
      },
      {
        'label': 'Mission Statement',
        'value': 'To serve the underprivileged and create a better future.',
        'icon': Icons.message
      },
      {
        'label': 'Scope of Operations',
        'value': 'National',
        'icon': Icons.public
      },
      {
        'label': 'Type of Donations Accepted',
        'value': 'Money, Goods, Services',
        'icon': Icons.monetization_on
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: const Text(
          'Organization Info',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.white, // Set background color to white
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Organization Logo, Name, and Email in a row
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Organization logo from the array
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage(
                      orgInfo[2]['value']!), // Accessing logo from the array
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Organization name from the array
                    Text(
                      orgInfo[0]['value']!, // Accessing name from the array
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Email from the array
                    Row(
                      children: [
                        Icon(
                          orgInfo[1]['icon'], // Email icon
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          orgInfo[1]
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
            for (var i = 3;
                i < orgInfo.length;
                i++) // Skipping first three items
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Icon(
                          orgInfo[i]['icon'],
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          orgInfo[i]['label']!,
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
                    orgInfo[i]['value']!,
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
