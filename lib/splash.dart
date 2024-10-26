import 'package:flutter/material.dart';
import 'package:giventake/main.dart';
import 'role_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: splashBackgroundColor, // Set blue background color here
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(flex: 3),
            Column(
              children: <Widget>[
                Image.asset(
                  'logo.png',
                  width: 60,
                  height: 60,
                ),
                const SizedBox(height: 10),
                const Text(
                  'GiveNTake',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: '',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const Spacer(flex: 3),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) => const ChooseRoleScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: darkBlue,
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
