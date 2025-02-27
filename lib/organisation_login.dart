import 'package:flutter/material.dart';
import 'package:giventake/main.dart'; // Import your main.dart or where you have defined your colors

class OrganizationLogin extends StatelessWidget {
  const OrganizationLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Organization Login',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 1,
        automaticallyImplyLeading: false, // Remove the back button
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Centered multi-user icon in a circle
            Center(
              child: Container(
                width: 80, // Circle width
                height: 80, // Circle height
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: lightBlue, // Circle background color
                ),
                child: const Icon(
                  Icons.people, // Multi-user icon
                  size: 60, // Icon size
                  color: Colors.white, // Icon color
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Email field with icon
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: const Icon(Icons.email, color: lightBlue),
                border: const UnderlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            // Password field with icon
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: const Icon(Icons.lock, color: lightBlue),
                border: const UnderlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            // Login button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle organization login logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: lightBlue,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Login'),
              ),
            ),
            const SizedBox(height: 20),
            // Registration text button
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Don't have an account? Register",
                  style: TextStyle(color: lightBlue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
