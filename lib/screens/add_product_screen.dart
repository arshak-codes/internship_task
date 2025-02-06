import 'package:flutter/material.dart';
import '../services/api_service.dart';

class AddProductScreen extends StatefulWidget {
  final String baseUrl;

  const AddProductScreen({super.key, required this.baseUrl});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  late final ApiService _apiService;

  // Add controllers for form fields
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _servingInfoController = TextEditingController();
  final _noteController = TextEditingController();

  bool inStockStatus = false;
  bool canUploadImages = false;
  String? selectedFoodType; // Add this variable

  // Add food type options
  final List<String> foodTypes = [
    'Vegetarian',
    'Non-Vegetarian',
    'Vegan',
    'Egg',
  ];

  @override
  void initState() {
    super.initState();
    _apiService = ApiService(baseUrl: widget.baseUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD PRODUCT'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLabelWithSwitch(
              'In Stock Status:',
              inStockStatus,
              (value) => setState(() => inStockStatus = value),
            ),
            _buildLabelWithSwitch(
              'Upload Product Images:',
              canUploadImages,
              (value) => setState(() => canUploadImages = value),
            ),
            const Text(
              'Customers can add up to 2 product images for customisation!',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            _buildRequiredLabel('Food Preference:'),
            DropdownButtonFormField<String>(
              value: selectedFoodType,
              decoration: InputDecoration(
                hintText: 'Select Food Type',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              items: foodTypes.map((String type) {
                return DropdownMenuItem<String>(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedFoodType = newValue;
                });
              },
            ),
            const SizedBox(height: 16),
            _buildRequiredLabel('Product Name:'),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Enter Product Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildRequiredLabel('Description:'),
            TextField(
              controller: _descriptionController,
              maxLines: 4,
              maxLength: 500,
              decoration: InputDecoration(
                hintText: 'Write Product Description!',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Serving Information:'),
            TextField(
              controller: _servingInfoController,
              maxLines: 4,
              maxLength: 500,
              decoration: InputDecoration(
                hintText: 'Write Serving Information!',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Note:'),
            TextField(
              controller: _noteController,
              maxLines: 4,
              maxLength: 500,
              decoration: InputDecoration(
                hintText: 'Write Note!',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildRequiredLabel('Flavour, Size & Price Chart:'),
            ElevatedButton(
              onPressed: () {
                // Handle Edit List
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(double.infinity, 48),
              ),
              child: const Text('Edit List'),
            ),
            const SizedBox(height: 16),
            const Text('Customizations:'),
            ElevatedButton(
              onPressed: () {
                // Handle Edit List
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(double.infinity, 48),
              ),
              child: const Text('Edit List'),
            ),
            const SizedBox(height: 16),
            _buildRequiredLabel('Add Product Image (Max 1):'),
            ElevatedButton(
              onPressed: () {
                // Handle image upload
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(double.infinity, 48),
              ),
              child: const Text('Upload Image'),
            ),
            const SizedBox(height: 24),
            OutlinedButton(
              onPressed: () {
                // Handle Copy
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
                side: const BorderSide(color: Colors.red),
                minimumSize: const Size(double.infinity, 48),
              ),
              child: const Text('Copy'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _saveProduct,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(double.infinity, 48),
              ),
              child: const Text('Save'),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildLabelWithSwitch(
      String label, bool value, Function(bool) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.red,
        ),
      ],
    );
  }

  Widget _buildRequiredLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Text(label),
          const Text(
            '*',
            style: TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }

  Future<void> _saveProduct() async {
    try {
      if (selectedFoodType == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a food type')),
        );
        return;
      }

      final productData = {
        'name': _nameController.text,
        'description': _descriptionController.text,
        'inStock': inStockStatus,
        'foodPreference': selectedFoodType,
        'servingInformation': _servingInfoController.text,
        'note': _noteController.text,
        // Add other fields as needed
      };

      await _apiService.addProduct(productData);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Product saved successfully')),
      );
      Navigator.pop(context, true);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }
}
