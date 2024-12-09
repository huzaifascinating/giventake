import 'package:flutter/material.dart';

class DonorJDC extends StatelessWidget {
  const DonorJDC({Key? key}) : super(key: key);

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
                        'JDC Welfare',
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
                      'assets/jdc.png', // JDC organization image moved to the extreme right
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
                    'About JDC',
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
                'JDC Welfare is a non-governmental organization focused on assisting underprivileged and marginalized communities. The organization has been serving the needy since 2007, providing aid, medical services, and food to thousands of families annually.',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'JDC Welfare runs various programs, including free medical camps, educational initiatives, and social welfare activities. Their goal is to empower communities and support individuals in need, regardless of their background or faith.',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'JDC Welfare’s commitment to transparency and compassion ensures that every donation reaches those in need, and the organization continues to expand its services across Pakistan and abroad.',
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
