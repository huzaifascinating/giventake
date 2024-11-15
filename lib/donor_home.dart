import 'package:flutter/material.dart';
import 'main.dart'; // Ensure your `lightBlue` color is defined here

class DonorHome extends StatefulWidget {
  const DonorHome({super.key});

  @override
  _DonorHomeState createState() => _DonorHomeState();
}

class _DonorHomeState extends State<DonorHome> {
  final Map<String, bool> _selectedCategories = {
    'Food': false,
    'Clothes': false,
    'Money': false,
    'Others': false,
  };

  int _currentIndex = 0; // Track the selected bottom navigation item

  bool get _isAnyCategorySelected =>
      _selectedCategories.values.any((isSelected) => isSelected);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.person), // User logo placeholder
          onPressed: () {
            // Handle user profile action
          },
        ),
        title: const Text(
          'Welcome, Username', // Replace with dynamic username
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications), // Notification bell icon
            onPressed: () {
              // Handle notification action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: _selectedCategories.keys.map((category) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        bottom: 5.0), // Add spacing between cards
                    child: _buildCategoryCard(
                      icon: _getIconForCategory(category),
                      title: category,
                      description: _getDescriptionForCategory(category),
                      isSelected: _selectedCategories[category]!,
                      onTap: () {
                        setState(() {
                          _selectedCategories[category] =
                              !_selectedCategories[category]!;
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
            // Next button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isAnyCategorySelected
                    ? () {
                        final selectedCategories = _selectedCategories.entries
                            .where((entry) => entry.value)
                            .map((entry) => entry.key)
                            .toList();

                        // Example: Print the selected categories
                        print('Selected Categories: $selectedCategories');

                        // Navigate to the next page with selected categories if required
                      }
                    : null, // Disable button when no category is selected
                style: ElevatedButton.styleFrom(
                  backgroundColor: lightBlue,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor:
                      Colors.grey[300], // Disabled button background
                  disabledForegroundColor:
                      Colors.grey[500], // Disabled button text color
                ),
                child: const Text('Next'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'My Donations',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: lightBlue, // Highlight the selected item
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            // Handle navigation based on selected tab
            switch (index) {
              case 0:
                // Navigate to Home
                break;
              case 1:
                // Navigate to My Donations
                break;
              case 2:
                // Navigate to Profile
                break;
            }
          });
        },
      ),
    );
  }

  Widget _buildCategoryCard({
    required IconData icon,
    required String title,
    required String description,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // Slightly larger rounding
        ),
        elevation: 4, // Slightly higher elevation
        child: Padding(
          padding:
              const EdgeInsets.all(18.0), // Increase padding for larger cards
          child: Row(
            children: [
              Icon(
                icon,
                size: 50, // Larger icon
                color: lightBlue,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20, // Slightly larger font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              Checkbox(
                value: isSelected,
                onChanged: (value) {
                  setState(() {
                    _selectedCategories[title] = value!;
                  });
                },
                shape: const CircleBorder(), // Circular checkbox
                activeColor: Colors.green,
                checkColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getIconForCategory(String category) {
    switch (category) {
      case 'Food':
        return Icons.fastfood;
      case 'Clothes':
        return Icons.checkroom;
      case 'Money':
        return Icons.attach_money;
      case 'Others':
        return Icons.category;
      default:
        return Icons.help;
    }
  }

  String _getDescriptionForCategory(String category) {
    switch (category) {
      case 'Food':
        return 'Donate food to those in need.';
      case 'Clothes':
        return 'Share your gently used clothes.';
      case 'Money':
        return 'Provide financial assistance.';
      case 'Others':
        return 'Donate items of other categories.';
      default:
        return 'No description available.';
    }
  }
}
