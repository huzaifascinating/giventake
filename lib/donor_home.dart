import 'package:flutter/material.dart';
import 'package:giventake/donor_categoryform.dart';
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
    'Food': Colors.orange,
    'Clothes': Colors.blue,
    'Money': Colors.green,
    'Others': Colors.grey,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {
            // Handle user profile action
          },
        ),
        title: const Text(
          'Welcome, Username',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
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
            // Select Donation Category with Next Button
            _buildSelectTextWithTick('Select Donation Category'),
            const SizedBox(height: 13),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 12.0,
                  childAspectRatio: 1.175,
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
                    iconColor: _categoryColors[category]!,
                    textColor: _categoryColors[category]!,
                  );
                },
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
            icon: Icon(Icons.card_giftcard),
            label: 'My Donations',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: lightBlue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            // Handle navigation based on selected tab
          });
        },
        backgroundColor: Colors.white,
        selectedLabelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
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
            Icons.arrow_drop_down,
            color: lightBlue,
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
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 60,
            height: 30, // Reduced height
            child: ElevatedButton.icon(
              onPressed: _isAnyCategorySelected
                  ? () {
                      final selectedCategories = _selectedCategories.entries
                          .where((entry) => entry.value)
                          .map((entry) => entry.key)
                          .toList();

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DonorCategoryForm(
                              selectedCategories: selectedCategories),
                        ),
                      );
                    }
                  : null,
              label: const Text('Next'),
              style: ElevatedButton.styleFrom(
                backgroundColor: lightBlue,
                foregroundColor: Colors.white,
                disabledBackgroundColor: Colors.grey[300],
                disabledForegroundColor: Colors.grey[500],
                padding: const EdgeInsets.symmetric(horizontal: 8),
                textStyle: const TextStyle(
                  fontSize: 12, // Smaller font size
                  fontWeight: FontWeight.bold,
                ),
              ),
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
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 57,
                color: iconColor,
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 6),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
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
