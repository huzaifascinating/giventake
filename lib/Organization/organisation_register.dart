import 'package:flutter/material.dart';
import 'package:giventake/main.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
  final TextEditingController _organizationNameController =
      TextEditingController();
  final TextEditingController _registrationNumberController =
      TextEditingController();
  final TextEditingController _missionStatementController =
      TextEditingController();
  final TextEditingController _bankAccountController = TextEditingController();
  final TextEditingController _scopeController = TextEditingController();
  final TextEditingController _address = TextEditingController();

  final FocusNode _passwordFocusNode =
      FocusNode(); // FocusNode for password field
  bool _isEmailValid = true;
  bool _showChecklist = false; // Flag to show/hide the checklist

  bool _hasUppercase = false;
  bool _hasSpecialCharacter = false;
  bool _isLengthValid = false;

  String? _organizationType;
  String? _donationType;
  bool _isTaxExempt = false;

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
  
  Future<void> _registerOrganization() async {
  if (!_formKey.currentState!.validate()) return;

  print("Register button clicked!");
  print("Organization Name: ${_organizationNameController.text}");
  print("Registration Number: ${_registrationNumberController.text}");
  print("Organization Type: $_organizationType");
  print("Mission Statement: ${_missionStatementController.text}");
  print("Bank Account Details: ${_bankAccountController.text}");
  print("Scope: ${_scopeController.text}");
  print("Donation Type: $_donationType");
  print("Tax Exempt: $_isTaxExempt");
  print("Email: ${_emailController.text}");
  print("Password: ${_passwordController.text}");
  print("Address: ${_address.text}");

  final url = Uri.parse('http://localhost:3000/api/organization/register');

  final Map<String, dynamic> data = {
    "name": _organizationNameController.text,
    "email": _emailController.text,
    "password": _passwordController.text,
    "registration_number": _registrationNumberController.text,
    "org_type": _organizationType ?? "",
    "mission_statement": _missionStatementController.text,
    "bank_details": _bankAccountController.text,
    "donationType": _donationType ?? "",
    "scope": _scopeController.text,
    "tax_exempt": _isTaxExempt,
    "address": _address.text,
  };

  try {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );

    print("Response Status: ${response.statusCode}");
    print("Response Body: ${response.body}");

    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Registration successful!")),
      );
      Navigator.pop(context);
    } else {
      final responseData = jsonDecode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(responseData["message"] ?? "Registration failed"),
        ),
      );
    }
  } catch (e) {
    print("Error: $e");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Error: $e")),
    );
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
                    Icons.business,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Organization Name field with icon
              TextFormField(
                controller: _organizationNameController,
                decoration: const InputDecoration(
                  labelText: 'Organization Name',
                  prefixIcon: Icon(Icons.business, color: lightBlue),
                  border: UnderlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Organization name is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // Registration/License Number field
              TextFormField(
                controller: _registrationNumberController,
                decoration: const InputDecoration(
                  labelText: 'Registration/License Number',
                  prefixIcon: Icon(Icons.confirmation_number, color: lightBlue),
                  border: UnderlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Registration number is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // Type of Organization (Radio Buttons)
              const Text('Type of Organization'),
              Row(
                children: [
                  Radio<String>(
                    value: 'NGO',
                    groupValue: _organizationType,
                    onChanged: (String? value) {
                      setState(() {
                        _organizationType = value;
                      });
                    },
                  ),
                  const Text('NGO'),
                  Radio<String>(
                    value: 'Non-Profit',
                    groupValue: _organizationType,
                    onChanged: (String? value) {
                      setState(() {
                        _organizationType = value;
                      });
                    },
                  ),
                  const Text('Non-Profit'),
                  Radio<String>(
                    value: 'Charity',
                    groupValue: _organizationType,
                    onChanged: (String? value) {
                      setState(() {
                        _organizationType = value;
                      });
                    },
                  ),
                  const Text('Charity'),
                ],
              ),
              const SizedBox(height: 20),
              // Mission Statement field
              TextFormField(
                controller: _missionStatementController,
                decoration: const InputDecoration(
                  labelText: 'Mission Statement',
                  prefixIcon: Icon(Icons.description, color: lightBlue),
                  border: UnderlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Mission statement is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // Bank Account Details field
              TextFormField(
                controller: _bankAccountController,
                decoration: const InputDecoration(
                  labelText: 'Bank Account Details',
                  prefixIcon: Icon(Icons.account_balance, color: lightBlue),
                  border: UnderlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Bank account details are required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // Scope of Operations field
              TextFormField(
                controller: _scopeController,
                decoration: const InputDecoration(
                  labelText: 'Scope of Operations',
                  prefixIcon: Icon(Icons.location_on, color: lightBlue),
                  border: UnderlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Scope of operations is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // Types of Donations Accepted (Checkbox)
              const Text('Types of Donations Accepted'),
              CheckboxListTile(
                title: const Text('Funds'),
                value: _donationType == 'Funds',
                onChanged: (bool? value) {
                  setState(() {
                    _donationType = value == true ? 'Funds' : null;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Goods'),
                value: _donationType == 'Goods',
                onChanged: (bool? value) {
                  setState(() {
                    _donationType = value == true ? 'Goods' : null;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Food'),
                value: _donationType == 'Food',
                onChanged: (bool? value) {
                  setState(() {
                    _donationType = value == true ? 'Food' : null;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Services'),
                value: _donationType == 'Services',
                onChanged: (bool? value) {
                  setState(() {
                    _donationType = value == true ? 'Services' : null;
                  });
                },
              ),
              const SizedBox(height: 20),
              // Tax Exempt checkbox
              CheckboxListTile(
                title: const Text('Tax-Exempt Organization'),
                value: _isTaxExempt,
                onChanged: (bool? value) {
                  setState(() {
                    _isTaxExempt = value ?? false;
                  });
                },
              ),
              const SizedBox(height: 30),
              // Organization Name field with icon
              TextFormField(
                controller: _address,
                decoration: const InputDecoration(
                  labelText: 'Organization Address',
                  prefixIcon: Icon(Icons.business, color: lightBlue),
                  border: UnderlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Organization address is required';
                  }
                  return null;
                },
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
                  onPressed: _registerOrganization,
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
