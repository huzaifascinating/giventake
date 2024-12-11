import 'package:flutter/material.dart';
import 'package:giventake/Organization/organization_notifications.dart';
import 'package:giventake/main.dart';
import 'organization_requests.dart';

class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> orders = [
      {
        'status': 'Pending Orders',
        'count': 2,
        'icon': Icons.access_time,
        'color': Colors.red,
        'contentColor': primaryColor,
        'routePush': const OrganizationRequestsPage()
      },
      {
        'status': 'Completed Orders',
        'count': 50,
        'icon': Icons.check_circle,
        'color': darkBlue,
        'contentColor': primaryColor,
        // 'routePush': const HistoryTab(),
      },
      {
        'status': 'Total Orders',
        'count': 52,
        'icon': Icons.list_alt,
        'color': const Color.fromARGB(255, 246, 143, 0),
        'contentColor': primaryColor
      },
    ];

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(color: secondaryColor),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: secondaryColor),
        elevation: 1,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: lightBlue),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OrganizationNotificationsPage(),
                ),
              );
            },
          )

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
                    style: TextStyle(fontSize: 22, color: secondaryColor),
                  ),
                  Text(
                    'Saylani',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: secondaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Column(
                children: [
                  const SizedBox(height: 15),
                  ...orders.take(3).map((order) {
                    return Column(
                      children: [
                        _buildFullWidthOrderContainer(
                          title: order['status'],
                          count: order['count'],
                          icon: order['icon'],
                          color: order['color'],
                          contentColor: order['contentColor'],
                          onTap: () {
                            if (order['routePush'] != null) {
                              // Perform the navigation when routePush is provided
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => order['routePush']),
                              );
                            }
                          },
                        ),
                        const SizedBox(height: 13),
                      ],
                    );
                  }),
                ],
              ),
              const SizedBox(height: 8),
              Column(
                children: [
                  _buildOptionItem(
                    title: 'Donation Requests',
                    icon: Icons.request_page,
                    context: context,
                  ),
                  const Divider(color: secondaryColor),
                  _buildOptionItem(
                    title: 'Add Highlights',
                    icon: Icons.star,
                    context: context,
                  ),
                  const Divider(color: secondaryColor),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildFullWidthOrderContainer({
    required String title,
    required int count,
    required IconData icon,
    required Color color,
    required Color contentColor,
    VoidCallback ? onTap,
  }) {
    return GestureDetector(
      onTap: onTap ?? (){}, // Handle tap
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: contentColor, size: 40),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: contentColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  count.toString(),
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: contentColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionItem(
      {required String title,
      required IconData icon,
      required BuildContext context}) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: darkBlue),
          const SizedBox(width: 10),
          Text(title),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios,
            size: 18,
            color: darkBlue,
          ),
        ],
      ),
      onTap: () {
        if (title == 'Donation Requests') {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const OrganizationRequestsPage()),
          );
        } else if (title == 'Add Highlights') {
          // Navigate to the highlights page
        }
      },
    );
  }
}
  // Widget _buildOrderContainer({
  //   required String title,
  //   required int count,
  //   required IconData icon,
  //   required Color color,
  //   required Color contentColor,
  // }) {
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: color,
  //       borderRadius: BorderRadius.circular(15),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.black.withOpacity(0.1),
  //           blurRadius: 10,
  //           offset: const Offset(0, 4),
  //         ),
  //       ],
  //     ),
  //     padding: const EdgeInsets.all(16),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Align(
  //           alignment: Alignment.topRight,
  //           child: Stack(
  //             alignment: Alignment.topRight,
  //             children: [
  //               Icon(icon, color: contentColor, size: 40),
  //               Positioned(
  //                 top: 0,
  //                 right: 0,
  //                 child: Container(
  //                   padding: const EdgeInsets.all(4),
  //                   decoration: BoxDecoration(
  //                     color: Colors.orange,
  //                     shape: BoxShape.circle,
  //                   ),
  //                   child: const Icon(
  //                     Icons.timer_outlined,
  //                     size: 12,
  //                     color: Colors.white,
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         const Spacer(),
  //         Text(
  //           title,
  //           style: TextStyle(
  //             fontSize: 16,
  //             fontWeight: FontWeight.bold,
  //             color: contentColor,
  //           ),
  //         ),
  //         const SizedBox(height: 8),
  //         Text(
  //           count.toString(),
  //           style: TextStyle(
  //             fontSize: 36,
  //             fontWeight: FontWeight.bold,
  //             color: contentColor,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
