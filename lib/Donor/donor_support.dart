import 'package:flutter/material.dart';

class HelpSupportPage extends StatelessWidget {
  final List<Map<String, dynamic>> faqs = [
    {
      'question': 'How do I donate items?',
      'answer':
          'You can donate items by selecting a category, providing the details, and submitting your donation form.',
      'icon': Icons.volunteer_activism,
    },
    {
      'question': 'Can I track my donations?',
      'answer':
          'Yes, you can track your donations from the "My Donations" section in your dashboard.',
      'icon': Icons.track_changes,
    },
    {
      'question': 'How do I change my account details?',
      'answer':
          'Go to the "Profile" section and update your personal information.',
      'icon': Icons.person,
    },
    {
      'question': 'What types of items can I donate?',
      'answer':
          'You can donate food, clothes, money, or other useful items like furniture or appliances.',
      'icon': Icons.category,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Help & Support",
        ),
        centerTitle: true,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // FAQs Section
              const SizedBox(height: 12),
              ...faqs.map((faq) => _buildFaqCard(faq)).toList(),
              const SizedBox(height: 24),
              // Contact Us Section
              const SizedBox(height: 12),
              _buildContactForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFaqCard(Map<String, dynamic> faq) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ExpansionTile(
        leading: Icon(faq['icon'], color: Colors.blue),
        title: Text(
          faq['question']!,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              faq['answer']!,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactForm() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Contact Us",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 12),
            const TextField(
              decoration: InputDecoration(
                labelText: "Name",
                labelStyle: TextStyle(fontSize: 16),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person, color: Colors.blue),
              ),
            ),
            const SizedBox(height: 12),
            const TextField(
              decoration: InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(fontSize: 16),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email, color: Colors.blue),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 12),
            const TextField(
              decoration: InputDecoration(
                labelText: "Message",
                labelStyle: TextStyle(fontSize: 16),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.message, color: Colors.blue),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle form submission
                  print("Form submitted");
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text("Send Message"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HelpSupportPage(),
  ));
}
