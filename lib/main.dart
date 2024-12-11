import 'package:flutter/material.dart';
import 'package:giventake/splash.dart';

const Color primaryColor = Colors.white;
const Color secondaryColor = Colors.black87;
const Color backgroundColor = Color.fromARGB(255, 231, 231, 231);
const Color darkBlue = Color.fromARGB(255, 0, 68, 151);
const Color lightBlue = Color(0xFF2193FF);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GiveNTake',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: backgroundColor,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: darkBlue),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
