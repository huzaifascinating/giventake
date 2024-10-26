import 'package:flutter/material.dart';
import 'package:giventake/donor_login.dart';
import 'package:giventake/main.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const SizedBox(width: 8),
            const Text(
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
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: lightBlue,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.person,
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
                decoration: InputDecoration(
                  labelText: 'Donor Name',
                  prefixIcon: const Icon(Icons.person, color: lightBlue),
                  border: const UnderlineInputBorder(),
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
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock, color: lightBlue),
                  border: const UnderlineInputBorder(),
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
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  prefixIcon: const Icon(Icons.lock_outline, color: lightBlue),
                  border: const UnderlineInputBorder(),
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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Handle registration logic here
                    }
                  },
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DonorLogin(),
                      ),
                    );
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
