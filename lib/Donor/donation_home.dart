import 'package:flutter/material.dart';
import 'package:giventake/Donor/donor_categoryform.dart';

import '../main.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({super.key});
  @override
  _DonationScreenState createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  final Map<String, bool> _selectedCategories = {
    'Food': false,
    'Clothes': false,
    'Money': false,
    'Others': false,
  };

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
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          children: [
            _buildSelectTextWithTick('Select Category'),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
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
    );
  }

  Widget _buildSelectTextWithTick(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent), // Remove border
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Add the info icon to the left of the text
          const Icon(
            Icons.info, // Info icon
            color: Colors.grey,
          ),
          const SizedBox(width: 8), // Add some space between the icon and text
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            width: 55, // Reduced width
            height: 28, // Reduced height
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
              icon: const Icon(Icons.arrow_forward), // Next icon
              label: const SizedBox.shrink(), // No text, only icon
              style: ElevatedButton.styleFrom(
                backgroundColor: lightBlue,
                foregroundColor: Colors.white,
                disabledBackgroundColor: Colors.grey[300],
                disabledForegroundColor: Colors.grey[500],
                padding: const EdgeInsets.only(
                    left: 8.0), // Reduced horizontal padding
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
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          child: Column(
            children: [
              // Icon on the extreme left
              Row(
                children: [
                  Icon(
                    icon,
                    size: 57,
                    color: iconColor,
                  ),
                  const SizedBox(width: 10),
                  // Category name and description to the right of the icon
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                        Text(
                          description,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              // Select button with icon, full width below description
              SizedBox(
                width: double.infinity,
                child: TextButton.icon(
                  onPressed: () {
                    setState(() {
                      _selectedCategories[title] = !_selectedCategories[title]!;
                    });
                  },
                  icon: isSelected
                      ? const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        )
                      : const SizedBox.shrink(), // No icon when not selected
                  label: Text(
                    isSelected ? 'Selected' : 'Select',
                    style: TextStyle(
                      color: isSelected ? Colors.green : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    backgroundColor: isSelected
                        ? Colors.green.shade50
                        : Colors.grey.shade300, // Grey color when not selected
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
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
