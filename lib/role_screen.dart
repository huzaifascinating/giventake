import 'package:flutter/material.dart'; 
import 'package:giventake/Donor/donor_login.dart';
import 'package:giventake/Organization/organisation_login.dart';
import 'main.dart';

class ChooseRoleScreen extends StatelessWidget {
  const ChooseRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              darkBlue,
              lightBlue,
            ],
          ),
        ),
        child: 
      Padding(
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
                color: secondaryColor,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Please select whether you are an organization looking to register '
              'or a donor interested in supporting others.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: secondaryColor),
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
                            builder: (context) => const OrganizationLogin(),
                          ),
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.business,
                            size: 28, // Reduced icon size
                            color: primaryColor,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Organization',
                            style: TextStyle(
                              fontSize: 16, // Reduced font size
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
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
                            builder: (context) => const DonorLogin(),
                          ),
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.volunteer_activism,
                            size: 28, // Reduced icon size
                            color: primaryColor,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Donor',
                            style: TextStyle(
                              fontSize: 16, // Reduced font size
                              color: primaryColor,
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
    ),
    );
  }
}
