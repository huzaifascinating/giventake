import 'package:flutter/material.dart';
import 'package:giventake/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DonorRegistration extends StatefulWidget {
  const DonorRegistration({super.key});

  @override
  _DonorRegistrationState createState() => _DonorRegistrationState();
}

class _DonorRegistrationState extends State<DonorRegistration> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _donorNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final FocusNode _passwordFocusNode = FocusNode();
  bool _isEmailValid = true;
  bool _hasUppercase = false;
  bool _hasSpecialCharacter = false;
  bool _isLengthValid = false;
  bool _showChecklist = false; // Flag to show/hide the checklist

  @override
  void initState() {
    super.initState();
    _passwordFocusNode.addListener(() {
      setState(() {
        _showChecklist =
            _passwordFocusNode.hasFocus; // Show checklist when focused
      });
    });
  }

  @override
  void dispose() {
    _donorNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _passwordFocusNode.dispose(); // Dispose the FocusNode
    super.dispose();
  }

  void _validateEmail(String value) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    setState(() {
      _isEmailValid = emailRegex.hasMatch(value);
    });
  }

  void _validatePassword(String value) {
    setState(() {
      _hasUppercase = value.contains(RegExp(r'[A-Z]'));
      _hasSpecialCharacter = value.contains(RegExp(r'[!@#\$&*~]'));
      _isLengthValid = value.length >= 8;
    });
  }

  void _registerDonor() async {
    if (_formKey.currentState!.validate()) {
      final url = Uri.parse('http://localhost:3000/api/donor/register');

      final Map<String, dynamic> donorData = {
        "name": _donorNameController.text.trim(),
        "email": _emailController.text.trim(),
        "password": _passwordController.text,
      };

      try {
        final response = await http.post(
          url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(donorData),
        );

        if (response.statusCode == 201) {
          // Successful registration
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Registration successful!")),
          );
          Navigator.pop(context); // Navigate back to login
        } else {
          // Failed registration
          final responseBody = jsonDecode(response.body);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content:
                    Text(responseBody['message'] ?? "Registration failed")),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: $e")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            SizedBox(width: 8),
            Text(
              'Donor Registration',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        // Make the body scrollable
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: lightBlue,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.volunteer_activism,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Donor Name field with icon
              TextFormField(
                controller: _donorNameController,
                decoration: const InputDecoration(
                  labelText: 'Donor Name',
                  prefixIcon: Icon(Icons.person, color: lightBlue),
                  border: UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              // Email field with validation
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: const Icon(Icons.email, color: lightBlue),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: _isEmailValid ? Colors.grey : Colors.red,
                    ),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: _validateEmail,
                validator: (value) {
                  return _isEmailValid ? null : 'Enter a valid email address';
                },
              ),
              const SizedBox(height: 20),
              // Password field with validation
              TextFormField(
                controller: _passwordController,
                focusNode: _passwordFocusNode,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock, color: lightBlue),
                  border: UnderlineInputBorder(),
                ),
                obscureText: true,
                onChanged: _validatePassword,
                validator: (value) {
                  return (_hasUppercase &&
                          _hasSpecialCharacter &&
                          _isLengthValid)
                      ? null
                      : 'Password must meet all the constraints.';
                },
              ),
              const SizedBox(height: 20),
              // Password Constraints Checklist
              if (_showChecklist) // Show checklist only when focused
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          _hasUppercase ? Icons.check : Icons.close,
                          color: _hasUppercase ? Colors.green : Colors.red,
                          size: 15,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'At least one uppercase letter',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          _hasSpecialCharacter ? Icons.check : Icons.close,
                          color:
                              _hasSpecialCharacter ? Colors.green : Colors.red,
                          size: 15,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'At least one special character',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          _isLengthValid ? Icons.check : Icons.close,
                          color: _isLengthValid ? Colors.green : Colors.red,
                          size: 15,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'At least 8 characters long',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              // Confirm Password field
              TextFormField(
                controller: _confirmPasswordController,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  prefixIcon: Icon(Icons.lock_outline, color: lightBlue),
                  border: UnderlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // Register button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                   onPressed: _registerDonor,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: lightBlue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Register'),
                ),
              ),
              const SizedBox(height: 20),
              // Login text button
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Already have an account? Login',
                    style: TextStyle(color: lightBlue),
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
