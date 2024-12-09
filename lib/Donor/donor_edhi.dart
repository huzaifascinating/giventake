import 'package:flutter/material.dart';

class DonorEdhi extends StatelessWidget {
  const DonorEdhi({Key? key}) : super(key: key);

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
                        'Edhi Foundation',
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
                      'assets/edhi.png', // Edhi organization image moved to the extreme right
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
                    'About Edhi',
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
                'Edhi Foundation is a non-profit social welfare organization established by Abdul Sattar Edhi in 1951. It provides services in the fields of healthcare, education, and social services, and is one of the largest and most respected charitable organizations in Pakistan.',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Edhi Foundation operates a range of services including hospitals, mobile clinics, orphanages, and shelters. The foundation also runs the largest fleet of ambulances in Pakistan, helping save countless lives every year.',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'With its focus on humanitarian aid and social welfare, the Edhi Foundation has earned a reputation for its commitment to providing services to the most vulnerable segments of society.',
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
