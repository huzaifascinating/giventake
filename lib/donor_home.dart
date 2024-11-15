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

  // Define category colors
  final Map<String, Color> _categoryColors = {
    'Food': Colors.orange, // Color for Food
    'Clothes': Colors.blue, // Color for Clothes
    'Money': Colors.green, // Color for Money
    'Others': Colors.grey, // Color for Others
  };

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
            // Select Text with Tick Icon Container
            _buildSelectTextWithTick('Select Donation Category'),
            const SizedBox(height: 13), // Add space between heading and grid
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing:
                      12.0, // Reduce the horizontal space between cards
                  mainAxisSpacing:
                      12.0, // Reduce the vertical space between cards
                  childAspectRatio:
                      1.2, // Adjusted aspect ratio for shorter cards
                ),
                itemCount: _selectedCategories.keys.length,
                itemBuilder: (context, index) {
                  final category = _selectedCategories.keys.elementAt(index);
                  return _buildCategoryCard(
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
                    iconColor: _categoryColors[category]!, // Use category color
                    textColor: _categoryColors[category]!, // Use category color
                  );
                },
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
            icon:
                Icon(Icons.card_giftcard), // Updated to a donation-related icon
            label: 'My Donations',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: lightBlue, // Highlight the selected item
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true, // Show labels even for unselected items
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
        backgroundColor:
            Colors.white, // Optional: Change background color of bottom bar
        selectedLabelStyle: const TextStyle(
          fontSize: 14, // Set font size for selected label
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12, // Set font size for unselected label
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  // Custom container for text with select tick icon
  Widget _buildSelectTextWithTick(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: lightBlue, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            Icons.arrow_drop_down, // Downward arrow icon
            color: lightBlue, // Icon color
            size: 24,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              textAlign: TextAlign.center, // Center the text
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard({
    required IconData icon,
    required String title,
    required String description,
    required bool isSelected,
    required VoidCallback onTap,
    required Color iconColor,
    required Color textColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min, // Shrink to fit the content
            children: [
              Icon(
                icon,
                size: 57, // Reduced icon size
                color: iconColor, // Dynamic icon color
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18, // Reduced title font size
                  fontWeight: FontWeight.bold,
                  color: textColor, // Dynamic text color
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 6),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black, // Set description color to black
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                  height:
                      10), // Adjusted spacing between description and checkbox
              Checkbox(
                value: isSelected,
                onChanged: (value) {
                  setState(() {
                    _selectedCategories[title] = value!;
                  });
                },
                shape: const CircleBorder(),
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
