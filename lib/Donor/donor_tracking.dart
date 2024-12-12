import 'package:flutter/material.dart';

class DonorTrackingPage extends StatelessWidget {
  const DonorTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tracking"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Top message with tick icon
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.green,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.check_circle, color: Colors.green, size: 24.0),
                  SizedBox(width: 8.0),
                  Text(
                    "Your Order has been Accepted",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40.0),
            // Progress bar with phases
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildProgressStep(
                  context,
                  isCompleted: true,
                  title: "Order Placed",
                  subtitle: "Your order has been placed successfully.",
                ),
                _buildProgressStep(
                  context,
                  isCompleted: true,
                  title: "Order Confirmed",
                  subtitle: "The organization has confirmed your order.",
                ),
                _buildProgressStep(
                  context,
                  isCompleted: false,
                  title: "In Progress",
                  subtitle: "The organization is preparing your order.",
                ),
                _buildProgressStep(
                  context,
                  isCompleted: false,
                  title: "Completed",
                  subtitle: "Your order has been fulfilled.",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressStep(
    BuildContext context, {
    required bool isCompleted,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon indicator
          Column(
            children: [
              Icon(
                isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
                color: isCompleted ? Colors.blue : Colors.grey,
                size: 24.0,
              ),
              if (!isCompleted) const SizedBox(height: 50.0),
            ],
          ),
          const SizedBox(width: 16.0),
          // Step details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: isCompleted ? Colors.black : Colors.grey,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: isCompleted ? Colors.black : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
