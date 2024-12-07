import 'package:flutter/material.dart';
import 'donor_selectorg.dart';

class DonorCategoryForm extends StatelessWidget {
  final List<String> selectedCategories;

  const DonorCategoryForm({Key? key, required this.selectedCategories})
      : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Donation Details',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 2,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: selectedCategories.length,
                itemBuilder: (context, index) {
                  final category = selectedCategories[index];
                  return DonationCategoryCard(category: category);
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DonorSelector()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Next',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(width: 8.0),
                    Icon(
                      Icons.arrow_forward,
                      size: 20.0,
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}

class DonationCategoryCard extends StatefulWidget {
  final String category;

  const DonationCategoryCard({Key? key, required this.category})
      : super(key: key);

  @override
  _DonationCategoryCardState createState() => _DonationCategoryCardState();
}

class _DonationCategoryCardState extends State<DonationCategoryCard> {
  bool _isExpanded = false;

  // Form field controllers
  final Map<String, TextEditingController> _controllers = {
    'description': TextEditingController(),
    'quantity': TextEditingController(),
    'comments': TextEditingController(),
    'amount': TextEditingController(),
    'foodName': TextEditingController(),
  };

  String? _selectedClothingType;
  String? _selectedSize;
  String? _selectedCondition;
  String? _selectedFabric;

  final List<String> _clothingTypes = ['Shirt', 'Pants', 'Jacket', 'Sweater'];
  final List<String> _sizes = ['Small', 'Medium', 'Large', 'Extra Large'];
  final List<String> _conditions = ['New', 'Gently Used', 'Worn Out'];
  final List<String> _fabrics = ['Cotton', 'Wool', 'Synthetic', 'Leather'];

  // Food-specific fields
  String? _selectedFoodType;
  String? _selectedPackaging;
  String? _storageRequirement;
  DateTime? _expirationDate;

  // Money-specific fields
  String? _selectedCurrency;
  String? _paymentMethod;

  // Dropdown and radio options
  final List<String> _foodTypes = ['Dry Food', 'Canned Food', 'Fresh Produce'];
  final List<String> _packagingTypes = ['Sealed', 'Open', 'Original'];
  final List<String> _storageOptions = [
    'Refrigerated',
    'Frozen',
    'Room Temperature'
  ];
  final List<String> _currencies = ['USD', 'EUR', 'INR', 'GBP'];
  final List<String> _paymentMethods = ['Cash', 'Online Transfer'];

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
        return Icons.help_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Stack(
        children: [
          // Background Icon (only when expanded)
          if (_isExpanded)
            Positioned.fill(
              child: Opacity(
                opacity: 0.1,
                child: Icon(
                  _getIconForCategory(widget.category),
                  size: 250, // Adjust size as needed
                  color: Colors.blue,
                ),
              ),
            ),
          // Card content
          Column(
            children: [
              ListTile(
                leading: Icon(
                  _getIconForCategory(widget.category),
                  color: Colors.blue,
                  size: 30,
                ),
                title: Text(
                  widget.category,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(
                    _isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                ),
              ),
              if (_isExpanded)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: _buildFormForCategory(),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildFormForCategory() {
    switch (widget.category) {
      case 'Food':
        return _buildFoodForm();
      case 'Money':
        return _buildMoneyForm();
      case 'Clothes':
        return _buildClothesForm();
      default:
        return _buildGenericForm();
    }
  }

  List<Widget> _buildFoodForm() {
    return [
      _buildIconTextField(
        label: 'Food Name',
        icon: Icons.fastfood,
        controller: _controllers['foodName']!,
        keyboardType: TextInputType.text,
      ),
      const SizedBox(height: 10),
      _buildDropdown(
        label: 'Food Type',
        icon: Icons.restaurant_menu,
        value: _selectedFoodType,
        items: _foodTypes,
        onChanged: (value) {
          setState(() {
            _selectedFoodType = value;
          });
        },
      ),
      const SizedBox(height: 10),
      _buildIconTextField(
        label: 'Quantity (e.g., 5 kg, 10 cans)',
        icon: Icons.line_weight,
        controller: _controllers['quantity']!,
      ),
      const SizedBox(height: 10),
      _buildDropdown(
        label: 'Packaging Type',
        icon: Icons.inventory,
        value: _selectedPackaging,
        items: _packagingTypes,
        onChanged: (value) {
          setState(() {
            _selectedPackaging = value;
          });
        },
      ),
      const SizedBox(height: 10),
      _buildRadioGroupInline(
        label: 'Storage Requirement',
        icon: Icons.storage,
        options: _storageOptions,
        selectedValue: _storageRequirement,
        onChanged: (value) {
          setState(() {
            _storageRequirement = value;
          });
        },
      ),
      const SizedBox(height: 10),
      _buildDatePicker(
        label: 'Expiration Date',
        icon: Icons.calendar_today,
        selectedDate: _expirationDate,
        onDateSelected: (date) {
          setState(() {
            _expirationDate = date;
          });
        },
      ),
      const SizedBox(height: 10),
      _buildIconTextField(
        label: 'Additional Comments',
        icon: Icons.comment,
        controller: _controllers['comments']!,
      ),
    ];
  }

  List<Widget> _buildClothesForm() {
    return [
      _buildDropdown(
        label: 'Clothing Type',
        icon: Icons.checkroom,
        value: _selectedClothingType,
        items: _clothingTypes,
        onChanged: (value) {
          setState(() {
            _selectedClothingType = value;
          });
        },
      ),
      const SizedBox(height: 10),
      _buildDropdown(
        label: 'Size',
        icon: Icons.format_size,
        value: _selectedSize,
        items: _sizes,
        onChanged: (value) {
          setState(() {
            _selectedSize = value;
          });
        },
      ),
      const SizedBox(height: 10),
      _buildRadioGroupInline(
        label: 'Condition',
        icon: Icons.watch_later,
        options: _conditions,
        selectedValue: _selectedCondition,
        onChanged: (value) {
          setState(() {
            _selectedCondition = value;
          });
        },
      ),
      const SizedBox(height: 10),
      _buildDropdown(
        label: 'Fabric Type',
        icon: Icons.ac_unit,
        value: _selectedFabric,
        items: _fabrics,
        onChanged: (value) {
          setState(() {
            _selectedFabric = value;
          });
        },
      ),
      const SizedBox(height: 10),
      _buildIconTextField(
        label: 'Quantity',
        icon: Icons.line_weight,
        controller: _controllers['quantity']!,
        keyboardType: TextInputType.number,
      ),
      const SizedBox(height: 10),
      _buildIconTextField(
        label: 'Additional Comments',
        icon: Icons.comment,
        controller: _controllers['comments']!,
      ),
    ];
  }

  List<Widget> _buildMoneyForm() {
    return [
      _buildDropdown(
        label: 'Select Currency',
        icon: Icons.currency_exchange,
        value: _selectedCurrency,
        items: _currencies,
        onChanged: (value) {
          setState(() {
            _selectedCurrency = value;
          });
        },
      ),
      const SizedBox(height: 10),
      _buildIconTextField(
        label: 'Amount',
        icon: Icons.attach_money,
        controller: _controllers['amount']!,
        keyboardType: TextInputType.number,
      ),
      const SizedBox(height: 10),
      _buildRadioGroupInline(
        label: 'Payment Method',
        icon: Icons.payment,
        options: _paymentMethods,
        selectedValue: _paymentMethod,
        onChanged: (value) {
          setState(() {
            _paymentMethod = value;
          });
        },
      ),
    ];
  }

  List<Widget> _buildGenericForm() {
    return [
      _buildIconTextField(
        label: 'Description',
        icon: Icons.description,
        controller: _controllers['description']!,
      ),
      const SizedBox(height: 10),
      _buildIconTextField(
        label: 'Quantity',
        icon: Icons.line_weight,
        controller: _controllers['quantity']!,
        keyboardType: TextInputType.number,
      ),
      const SizedBox(height: 10),
      _buildIconTextField(
        label: 'Additional Comments',
        icon: Icons.comment,
        controller: _controllers['comments']!,
      ),
    ];
  }

  Widget _buildDropdown({
    required String label,
    required IconData icon,
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.blue),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      items: items
          .map((item) => DropdownMenuItem(
                value: item,
                child: Text(item),
              ))
          .toList(),
      onChanged: onChanged,
    );
  }

  Widget _buildRadioGroupInline({
    required String label,
    required IconData icon,
    required List<String> options,
    required String? selectedValue,
    required void Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.blue),
            const SizedBox(width: 8),
            Text(label, style: const TextStyle(color: Colors.black)),
          ],
        ),
        Row(
          children: options.map((option) {
            return Expanded(
              child: RadioListTile<String>(
                title: Text(option, style: const TextStyle(fontSize: 12)),
                value: option,
                groupValue: selectedValue,
                onChanged: onChanged,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildIconTextField({
    required String label,
    required IconData icon,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.blue),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    );
  }

  Widget _buildDatePicker({
    required String label,
    required IconData icon,
    required DateTime? selectedDate,
    required void Function(DateTime) onDateSelected,
  }) {
    return GestureDetector(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: selectedDate ?? DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if (pickedDate != null) {
          onDateSelected(pickedDate);
        }
      },
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.blue),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
        child: Text(
          selectedDate != null
              ? "${selectedDate.toLocal()}".split(' ')[0]
              : 'Select Date',
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
