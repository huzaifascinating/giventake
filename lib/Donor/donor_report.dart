import 'package:flutter/material.dart';

class DonorReport extends StatelessWidget {
  final Map<String, String> donationDetails;

  const DonorReport({super.key, required this.donationDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Donation Report",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title Section
                Center(
                  child: Column(
                    children: [
                      const Icon(
                        Icons.volunteer_activism,
                        size: 50,
                        color: Colors.blueAccent,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        donationDetails['title'] ?? 'Donation Details',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Date: ${donationDetails['date'] ?? 'Unknown'}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(thickness: 1),
                const SizedBox(height: 20),
                // Details Section
                _buildReportItem(
                  icon: Icons.person,
                  label: "Donor Name",
                  value: donationDetails['donorName'] ?? "Anonymous",
                ),
                _buildReportItem(
                  icon: Icons.location_city,
                  label: "Organization",
                  value: donationDetails['organization'] ?? "N/A",
                ),
                _buildReportItem(
                  icon: Icons.category,
                  label: "Category",
                  value: donationDetails['category'] ?? "General",
                ),
                _buildReportItem(
                  icon: Icons.info_outline,
                  label: "Additional Info",
                  value: donationDetails['additionalInfo'] ??
                      "No additional information provided.",
                ),
                const SizedBox(height: 20),

                // Item Images Section
                if (donationDetails['itemImages'] != null)
                  _buildImageSection(
                    label: "Donated Items",
                    imageUrl: donationDetails['itemImages']!,
                  ),

                // Organization Images Section
                if (donationDetails['orgImages'] != null)
                  _buildImageSection(
                    label: "Organization Images",
                    imageUrl: donationDetails['orgImages']!,
                  ),

                const SizedBox(height: 20),

                // Custom Message Section
                if (donationDetails['customMessage'] != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Organization Message",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          donationDetails['customMessage']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildReportItem({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueAccent, size: 30),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSection({
    required String label,
    required String imageUrl,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
