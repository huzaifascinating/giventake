import 'package:flutter/material.dart';

class DonorChippa extends StatelessWidget {
  const DonorChippa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 2,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: const Color(0xFFF5F5F5),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Align items on extreme left and right
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Row(
                    children: [
                      const Icon(
                        Icons.business, // Organization icon before the name
                        color: Colors.black,
                      ),
                      const SizedBox(width: 8.0),
                      const Text(
                        'Chippa Welfare',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      'assets/chippa.png', // Chippa organization image moved to the extreme right
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5.0),
              Divider(
                color: Colors.grey.shade400,
                thickness: 1,
              ),
              const SizedBox(height: 10.0),
              const Row(
                children: [
                  const Icon(
                    Icons.info,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 8.0),
                  const Text(
                    'About Chippa Welfare',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12.0),
              const Text(
                'Chippa Welfare Association is a renowned non-profit organization based in Pakistan. Founded in 2001 by Mr. Iqbal Chippa, it focuses on providing humanitarian services, particularly in the field of emergency response, disaster relief, and social welfare.',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Chippa Welfare Association operates ambulances, provides food and medical aid, and runs orphanages, hospitals, and schools. The organization works tirelessly to alleviate the suffering of the underprivileged and those affected by natural disasters.',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'The association is known for its swift response to emergencies, providing timely assistance to those in need. With a network of volunteers, Chippa Welfare is committed to improving the lives of vulnerable people in Pakistan.',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24.0),
              Center(
                child: SizedBox(
                  width: double.infinity, // Makes the button take full width
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Add navigation or action here
                    },
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Colors.blue,
                    ),
                    label: const Text(
                      'Learn More',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF5F5F5), // Light gray
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      side: BorderSide(
                        color: Colors.blue, // Optional blue border for accent
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
