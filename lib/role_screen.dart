import 'package:flutter/material.dart'; // Import your main.dart or where you have defined your colors
import 'organisation_register.dart'; // Import the organization registration page
import 'donor_register.dart'; // Import the donor registration page
import 'main.dart';

class ChooseRoleScreen extends StatelessWidget {
  const ChooseRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/role.png', // Path to the role image
              height: 300, // Increased image size
              width: 400,
            ),
            const Text(
              'Choose Role',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: darkBlue,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Please select whether you are an organization looking to register '
              'or a donor interested in supporting others.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Organization Button
                Expanded(
                  child: SizedBox(
                    height: 60, // Reduced button height
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: darkBlue, // Dark blue color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OrganizationRegister(),
                          ),
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.business,
                            size: 28, // Reduced icon size
                            color: Colors.white,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Organization',
                            style: TextStyle(
                              fontSize: 18, // Reduced font size
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                // Donor Button
                Expanded(
                  child: SizedBox(
                    height: 60, // Reduced button height
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: darkBlue, // Light blue color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DonorRegistration(),
                          ),
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.volunteer_activism,
                            size: 28, // Reduced icon size
                            color: Colors.white,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Donor',
                            style: TextStyle(
                              fontSize: 18, // Reduced font size
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
