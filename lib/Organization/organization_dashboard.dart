import 'package:flutter/material.dart';
import 'package:giventake/main.dart';

class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> orders = [
      {
        'status': 'Pending Orders',
        'count': 10,
        'icon': Icons.access_time,
        'color': Colors.red,
        'contentColor': Colors.white
      },
      {
        'status': 'Completed Orders',
        'count': 50,
        'icon': Icons.check_circle,
        'color': darkBlue,
        'contentColor': Colors.white
      },
      {
        'status': 'Total Orders',
        'count': 60,
        'icon': Icons.list_alt,
        'color': const Color.fromARGB(255, 246, 143, 0),
        'contentColor': Colors.white
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white, // Set the background to white
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 1,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.blue),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text(
                    'Hello, ',
                    style: TextStyle(fontSize: 22, color: Colors.black),
                  ),
                  Text(
                    'Saylani',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _buildOrderContainer(
                      title: orders[0]['status'],
                      count: orders[0]['count'],
                      icon: orders[0]['icon'],
                      color: orders[0]['color'],
                      contentColor: orders[0]['contentColor'],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildOrderContainer(
                      title: orders[1]['status'],
                      count: orders[1]['count'],
                      icon: orders[1]['icon'],
                      color: orders[1]['color'],
                      contentColor: orders[1]['contentColor'],
                    ),
                  ),
                ],
              ),
              _buildOrderContainer(
                title: orders[2]['status'],
                count: orders[2]['count'],
                icon: orders[2]['icon'],
                color: orders[2]['color'],
                contentColor: orders[2]['contentColor'],
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  _buildOptionItem(title: 'Donation Requests'),
                  const Divider(color: Colors.black45),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.star, color: Colors.white),
                  label: const Text('Add Highlights'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderContainer({
    required String title,
    required int count,
    required IconData icon,
    required Color color,
    required Color contentColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Icon(icon, color: contentColor, size: 24),
          const SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: contentColor,
            ),
          ),
          const SizedBox(height: 5),
          const Divider(color: Colors.black45),
          Text(
            count.toString(),
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: contentColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionItem({required String title}) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(Icons.request_page, size: 20, color: Colors.black),
          const SizedBox(width: 10),
          Text(title),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            size: 18,
            color: darkBlue, // You can change this color if needed
          ),
        ],
      ),
      onTap: () {},
    );
  }
}
