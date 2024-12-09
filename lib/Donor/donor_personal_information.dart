import 'package:flutter/material.dart';

class PersonalInformationForm extends StatelessWidget {
  // Dummy data for the initial fields
  final String firstName = "John";
  final String lastName = "Doe";
  final String email = "johndoe@example.com";
  final String phoneNumber = "+1234567890";
  final String location = "123 Main Street, Springfield";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Personal Information",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField(
              label: "First Name",
              initialValue: firstName,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              label: "Last Name",
              initialValue: lastName,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              label: "Email",
              initialValue: email,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              label: "Phone Number",
              initialValue: phoneNumber,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              label: "Location",
              initialValue: location,
              keyboardType: TextInputType.streetAddress,
            ),
            const SizedBox(height: 24),
            // Change Password Button
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle change password action
                  showDialog(
                    context: context,
                    builder: (context) => _buildChangePasswordDialog(context),
                  );
                },
                icon: const Icon(Icons.lock),
                label: const Text("Change Password"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40), // Spacing at the bottom
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String initialValue,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      initialValue: initialValue,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
      ),
    );
  }

  Widget _buildChangePasswordDialog(BuildContext context) {
    return AlertDialog(
      title: const Text("Change Password"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTextField(
            label: "Current Password",
            initialValue: "",
          ),
          const SizedBox(height: 16),
          _buildTextField(
            label: "New Password",
            initialValue: "",
          ),
          const SizedBox(height: 16),
          _buildTextField(
            label: "Confirm New Password",
            initialValue: "",
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Close the dialog
          },
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            // Handle password change logic here
            Navigator.pop(context); // Close the dialog
          },
          child: const Text("Save"),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PersonalInformationForm(),
  ));
}
