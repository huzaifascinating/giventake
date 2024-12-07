import 'package:flutter/material.dart';
import 'dart:async'; // Import for Timer
import 'main.dart';

class DonorValidationPage extends StatefulWidget {
  final String organizationName;
  final String organizationIcon;

  const DonorValidationPage({
    Key? key,
    required this.organizationName,
    required this.organizationIcon,
  }) : super(key: key);

  @override
  _DonorValidationPageState createState() => _DonorValidationPageState();
}

class _DonorValidationPageState extends State<DonorValidationPage> {
  late Timer _timer;
  int _start = 600;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        _timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  String get _formattedTime {
    int minutes = _start ~/ 60;
    int seconds = _start % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Validation"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/nav.png',
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 50.0),
                const Text(
                  "Waiting to connect...",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black12, // Light blue circle
                            shape: BoxShape.circle, // Circle shape
                          ),
                          padding: const EdgeInsets.all(
                              10.0), // Padding inside the circle
                          child: const Icon(Icons.person,
                              size: 33, color: Colors.black), // White icon
                        ),
                        const Text(
                          "Donor",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10.0),
                    const Icon(Icons.handshake,
                        size: 30, color: Color.fromARGB(255, 200, 202, 183)),
                    const SizedBox(width: 10.0),
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            widget.organizationIcon,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          widget.organizationName,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Container(
                  width: double.infinity, // Full width
                  color: Colors.grey[200], // Off-white color
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Center(
                    child: Text(
                      _formattedTime,
                      style: const TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
