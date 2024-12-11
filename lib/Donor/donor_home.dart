import 'package:flutter/material.dart';
import 'package:giventake/Donor/donation_history.dart';
import 'package:giventake/Donor/donor_dashboard.dart';
import 'package:giventake/Donor/donor_notifications.dart';
import 'package:giventake/Donor/donor_profile.dart';
import 'package:giventake/main.dart';

class DonorHome extends StatefulWidget {
  const DonorHome({super.key});

  @override
  _DonorHomeState createState() => _DonorHomeState();
}

class _DonorHomeState extends State<DonorHome> {
  int _currentIndex = 0; // Track the selected bottom navigation item

  final List<Widget> _screens = [
    const DonationScreen(),
    DonationHistoryScreen(),
    DonorProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'My Donations',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: lightBlue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the selected tab index
          });
        },
        backgroundColor: primaryColor,
        selectedLabelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
