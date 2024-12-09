import 'package:flutter/material.dart';

class HelpSupportPage extends StatelessWidget {
  final List<Map<String, String>> faqs = [
    {
      'question': 'How do I donate items?',
      'answer':
          'You can donate items by selecting a category, providing the details, and submitting your donation form.',
    },
    {
      'question': 'Can I track my donations?',
      'answer':
          'Yes, you can track your donations from the "My Donations" section in your dashboard.',
    },
    {
      'question': 'How do I change my account details?',
      'answer':
          'Go to the "Profile" section and update your personal information.',
    },
    {
      'question': 'What types of items can I donate?',
      'answer':
          'You can donate food, clothes, money, or other useful items like furniture or appliances.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Help & Support",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
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
              const Text(
                "Frequently Asked Questions",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              ...faqs.map((faq) => _buildFaqCard(faq)).toList(),
              const SizedBox(height: 24),
              // Contact Us Section
              const Text(
                "Contact Us",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              _buildContactForm(),
              const SizedBox(height: 24),
              // Other Support Options
              const Text(
                "Additional Resources",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              _buildSupportOption(
                context,
                title: "User Guide",
                description: "Learn how to use the app efficiently.",
                icon: Icons.book,
              ),
              _buildSupportOption(
                context,
                title: "Terms & Conditions",
                description: "Review our terms and policies.",
                icon: Icons.gavel,
              ),
              _buildSupportOption(
                context,
                title: "Privacy Policy",
                description: "Understand how we handle your data.",
                icon: Icons.privacy_tip,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFaqCard(Map<String, String> faq) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ExpansionTile(
        title: Text(
          faq['question']!,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              faq['answer']!,
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactForm() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            const TextField(
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 12),
            const TextField(
              decoration: InputDecoration(
                labelText: "Message",
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle form submission
                  print("Form submitted");
                },
                icon: const Icon(Icons.send),
                label: const Text("Send Message"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSupportOption(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(description),
      onTap: () {
        // Navigate to corresponding section (dummy for now)
        print("Navigated to $title");
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HelpSupportPage(),
  ));
}
