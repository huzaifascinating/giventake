import 'package:flutter/material.dart';
import 'package:giventake/main.dart';
import 'organisation_login.dart'; // Import the OrganizationLogin page

class OrganizationRegister extends StatefulWidget {
  const OrganizationRegister({super.key});

  @override
  _OrganizationRegisterState createState() => _OrganizationRegisterState();
}

class _OrganizationRegisterState extends State<OrganizationRegister> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final FocusNode _passwordFocusNode =
      FocusNode(); // FocusNode for password field
  bool _isEmailValid = true;
  bool _showChecklist = false; // Flag to show/hide the checklist

  bool _hasUppercase = false;
  bool _hasSpecialCharacter = false;
  bool _isLengthValid = false;

  @override
  void initState() {
    super.initState();

    // Add a listener to the FocusNode to show/hide the checklist
    _passwordFocusNode.addListener(() {
      setState(() {
        _showChecklist =
            _passwordFocusNode.hasFocus; // Show checklist when focused
      });
    });
  }

  @override
  void dispose() {
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
        title: const Row(
          children: [
            SizedBox(width: 8),
            Text(
              'Organization Registration',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Centered multi-user icon in a circle
              Center(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: lightBlue,
                  ),
                  child: const Icon(
                    Icons.people,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Organization Name field with icon
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Organization Name',
                  prefixIcon: Icon(Icons.business, color: lightBlue),
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
                focusNode: _passwordFocusNode, // Attach the FocusNode
                decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock, color: lightBlue),
                  border: UnderlineInputBorder(),
                ),
                obscureText: true,
                onChanged: (value) {
                  _validatePassword(value);
                },
                validator: (value) {
                  return (_hasUppercase &&
                          _hasSpecialCharacter &&
                          _isLengthValid)
                      ? null
                      : 'Password must meet all the constraints.';
                },
              ),
              const SizedBox(height: 20),
              if (_showChecklist)
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
                        builder: (context) => const OrganizationLogin(),
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
