import 'package:flutter/material.dart';
import 'package:giventake/main.dart';
import 'dart:math'; // For random values
import 'mrx.dart';

class ImpactReportPage extends StatelessWidget {
  const ImpactReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final food = random.nextInt(100) + 10; // Random value between 10 and 110
    final clothes = random.nextInt(100) + 10;
    final money = random.nextInt(100) + 10;
    final others = random.nextInt(100) + 10;

    // Total value for calculating percentages
    final total = food + clothes + money + others;

    // Create a list to store all the relevant data
    List<Map<String, dynamic>> donationData = [
      {
        'category': 'Food',
        'value': food,
        'percentage': (food / total) * 100,
        'label': '${((food / total) * 100).toStringAsFixed(1)}%',
      },
      {
        'category': 'Clothes',
        'value': clothes,
        'percentage': (clothes / total) * 100,
        'label': '${((clothes / total) * 100).toStringAsFixed(1)}%',
      },
      {
        'category': 'Money',
        'value': money,
        'percentage': (money / total) * 100,
        'label': '${((money / total) * 100).toStringAsFixed(1)}%',
      },
      {
        'category': 'Others',
        'value': others,
        'percentage': (others / total) * 100,
        'label': '${((others / total) * 100).toStringAsFixed(1)}%',
      },
    ];

    return Scaffold(
      backgroundColor:
          Colors.white, // Set the background color of the entire screen
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: const Text(
          'Impact Report',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Parent container with dark blue background for 'Orders'
            Container(
              width: double.infinity, // Make the container take full width
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors
                    .blue[900], // Dark blue color for the parent container
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title row with heading 'Orders' and icon at top-right
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Orders',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons
                            .volunteer_activism, // Changed to donation giving icon
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  ),
                  const SizedBox(
                      height: 16), // Space between title and containers

                  // Donation metrics containers inside the parent container
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 120, // Adjust height for more space
                          padding: const EdgeInsets.all(
                              16.0), // Added padding to container
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Row(
                            children: [
                              // Left side for the heading and number
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Total',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      '1500', // Replace with dynamic value if required
                                      style: TextStyle(
                                        fontSize: 32, // Increased number size
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Icon placed at the top right corner
                              Align(
                                alignment: Alignment.topRight,
                                child: Icon(
                                  Icons
                                      .volunteer_activism, // Changed to donation giving icon
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Container(
                          height: 120, // Adjust height for more space
                          padding: const EdgeInsets.all(
                              16.0), // Added padding to container
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Row(
                            children: [
                              // Left side for the heading and number
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Completed',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      '1200', // Replace with dynamic value if required
                                      style: TextStyle(
                                        fontSize: 32, // Increased number size
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Icon placed at the top right corner
                              Align(
                                alignment: Alignment.topRight,
                                child: Icon(
                                  Icons
                                      .check_circle, // Changed to donation giving icon
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
                height: 10), // SizedBox for spacing between containers

            // Donation Distribution Container
            Container(
              width: double.infinity, // Make the container take full width
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: darkBlue, // Dark blue color for the parent container
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title row with heading 'Donation Distribution' and icon at top-right
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Donation Distribution',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.money, // Icon for donation
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  ),
                  const SizedBox(
                      height:
                          16), // Space between title and pie chart container

                  // Pie chart inside the container
                  Container(
                    height: 290, // Reduced height for the pie chart container
                    child: SingleChildScrollView(
                      // Wrapping the chart in a scrollable widget
                      child: MRxPieChart(
                        data: donationData.map((data) {
                          return MRxPieData(
                            title: data['category'],
                            value: data['value'],
                            color: _getCategoryColor(data['category']),
                            label: data['label'],
                          );
                        }).toList(),
                        showLegend: true,
                        legendPosition:
                            MRxLegendPosition(position: LegendPosition.bottom),
                        legendTextStyle:
                            const TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to return color for each category
  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Food':
        return Colors.red;
      case 'Clothes':
        return Colors.blue;
      case 'Money':
        return Colors.green;
      case 'Others':
        return Colors.orange;
      default:
        return Colors.black;
    }
  }
}
