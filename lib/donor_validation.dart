import 'package:flutter/material.dart';
import 'dart:async';

class DonorValidationPage extends StatefulWidget {
  final String organizationName;
  final String organizationIcon;

  const DonorValidationPage({
    super.key,
    required this.organizationName,
    required this.organizationIcon,
  });

  @override
  _DonorValidationPageState createState() => _DonorValidationPageState();
}

class _DonorValidationPageState extends State<DonorValidationPage>
    with SingleTickerProviderStateMixin {
  late Timer _timer;
  int _start = 600;
  late AnimationController _loadingAnimationController;

  @override
  void initState() {
    super.initState();
    _startTimer();
    // Initialize AnimationController
    _loadingAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
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
    _loadingAnimationController.dispose(); // Dispose AnimationController
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
                  'assets/validation.png',
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 20.0), // Add some space
                // Limit the width of the LinearProgressIndicator
                SizedBox(
                  width: 200, // Set width here
                  child: LinearProgressIndicator(
                    value: null, // Indeterminate progress
                    backgroundColor: Colors.grey[300],
                    color: Colors.blue,
                    minHeight: 5,
                  ),
                ),
                const SizedBox(height: 30.0),
                const Text(
                  "Waiting to connect...",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  "Hang tight, the organization will contact you shortly\n for verification.",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center, // Center align text
                ),
                const SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.black12, // Light blue circle
                            shape: BoxShape.circle, // Circle shape
                          ),
                          padding: const EdgeInsets.all(
                              7.0), // Padding inside the circle
                          child: const Icon(Icons.person,
                              size: 25, color: Colors.black), // White icon
                        ),
                        const Text(
                          "Donor",
                          style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 20.0),
                    Container(
                      width: 2,
                      height: 50,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 20.0),
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            widget.organizationIcon,
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          widget.organizationName,
                          style: const TextStyle(
                            fontSize: 10.0,
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
                        color: Colors.red,
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
