import 'package:flutter/material.dart';

class DonorNotificationsPage extends StatelessWidget {
  const DonorNotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Example notifications data
    final List<Map<String, dynamic>> notifications = [
      {
        'title': 'Donation Accepted',
        'description': 'Donation request for 50 kg of rice has been accepted.',
        'time': '1 day ago',
        'icon': Icons.check_circle,
      },
      {
        'title': 'Donation Rejected',
        'description':
            'Unfortunately, your donation of old clothes was rejected.',
        'time': '3 days ago',
        'icon': Icons.cancel, // Updated icon for rejection
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return _buildNotificationItem(notification);
          },
        ),
      ),
    );
  }

  Widget _buildNotificationItem(Map<String, dynamic> notification) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(
          notification['icon']!, // Directly use IconData
          size: 40,
          color: Colors.blueAccent, // You can change color if needed
        ),
        title: Text(notification['title']!),
        subtitle: Text(notification['description']!),
        trailing: Text(notification['time']!),
        contentPadding: const EdgeInsets.all(12),
        onTap: () {
          // Handle notification tap, e.g., navigate to a detailed view
        },
      ),
    );
  }
}
