import 'package:flutter/material.dart';
import 'package:giventake/main.dart';

class OrganizationDonationInfoPage extends StatelessWidget {
  final Map<String, String> request;

  const OrganizationDonationInfoPage({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    // Example images, you can replace these with actual image URLs or assets.
    final List<String> donationImages = [
      'https://img.freepik.com/premium-photo/kind-people-working-food-donation-campaigns_259150-24762.jpg?ga=GA1.1.1588578779.1732476905&semt=ais_hybrid',
      'https://img.freepik.com/free-photo/person-receiving-box-with-donated-food_23-2148613153.jpg?ga=GA1.1.1588578779.1732476905&semt=ais_hybrid'
    ];

    // Placeholder data for donation details
    final donationDetails = [
      {'label': 'Donor Name', 'value': request['name'] ?? 'Anonymous'},
      {'label': 'Location', 'value': request['location'] ?? 'Gulistan-e-Jauhar block 2'},
      {'label': 'Donation Type', 'value': request['donationType'] ?? 'Food'},
      {'label': 'Quantity', 'value': request['quantity'] ?? '20Kg'},
      {'label': 'Contact', 'value': request['quantity'] ?? '03212471039'},

      {
        'label': 'Donation Date',
        'value': request['donationDate'] ?? '10/12/2024'
      },
      {
        'label': 'Additional Info',
        'value': request['additionalInfo'] ?? 'No Additional Information'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Donation Details",
          style: TextStyle(color: secondaryColor),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: secondaryColor),
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
                        color: lightBlue,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        request['name'] ?? 'Donation Request',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: secondaryColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Request: ${request['request'] ?? 'Unknown'}",
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

                // Donation Details Section (using donationDetails array)
                for (var detail in donationDetails)
                  _buildReportItem(
                    icon: Icons.info_outline,
                    label: detail['label']!,
                    value: detail['value']!,
                  ),
                const SizedBox(height: 20),

                // Donation Images Section
                if (donationImages.isNotEmpty)
                  _buildImageSection(
                    label: "Donation Images",
                    imageUrls: donationImages,
                  ),

                const SizedBox(height: 20),

                // Custom Message Section
                if (request['customMessage'] != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Organization Message",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: secondaryColor,
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
                          request['customMessage']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: secondaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),

                // Accept and Reject Buttons
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Accept Button with Tick Icon
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Handle accept action
                        },
                        icon: const Icon(Icons.check, color: Colors.white),
                        label: const Text('Accept'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8), // Slight border radius
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Handle reject action
                        },
                        icon: const Icon(Icons.close, color: Colors.white),
                        label: const Text('Reject'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8), // Slight border radius
                          ),
                        ),
                      ),
                    ),
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
    required List<String> imageUrls,
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
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: imageUrls.length,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrls[index],
                fit: BoxFit.cover,
                height: 100,
                width: 100,
              ),
            );
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
