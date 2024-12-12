import 'package:flutter/material.dart';
import 'donor_tracking.dart';

class DonorValidationPage extends StatelessWidget {
  final String organizationName;
  final String organizationIcon;

  const DonorValidationPage({
    super.key,
    required this.organizationName,
    required this.organizationIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Validation"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
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
                    const SizedBox(height: 20.0),
                    SizedBox(
                      width: 200,
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
                      "Please wait until the organization accepts your request for verification.",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.black12,
                                shape: BoxShape.circle,
                              ),
                              padding: const EdgeInsets.all(7.0),
                              child: const Icon(Icons.person,
                                  size: 25, color: Colors.black),
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
                                organizationIcon,
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              organizationName,
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
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DonorTrackingPage(),
                  ),
                );
              },
              backgroundColor: Colors.blue,
              child: const Icon(Icons.arrow_forward, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
