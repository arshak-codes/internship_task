import 'package:flutter/material.dart';
import 'packaging_delivery_screen.dart';
import 'product_details_screen.dart';

class ManageShopScreen extends StatefulWidget {
  final String baseUrl;

  const ManageShopScreen({super.key, required this.baseUrl});

  @override
  State<ManageShopScreen> createState() => _ManageShopScreenState();
}

class _ManageShopScreenState extends State<ManageShopScreen> {
  // Access the baseUrl using widget.baseUrl in this class

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MANAGE SHOP'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Shop Name:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text('Hub Quality Bakers'),
            const SizedBox(height: 8),
            const Text(
              'FSSAI License Number:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text('873687DHDHJH122'),
            const SizedBox(height: 16),
            const Text('Add Shop Display Photo (Max 1):'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // Handle add image
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Add Image',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.add_a_photo,
                color: Colors.red,
                size: 24,
              ),
            ),
            const SizedBox(height: 16),
            _buildMenuButton(context, 'Offer & Discount'),
            _buildMenuButton(context, 'Other Settings'),
            _buildMenuButton(context, 'Packaging & Delivery'),
            _buildMenuButton(context, 'Products'),
            _buildMenuButton(context, 'Promotions'),
            const SizedBox(height: 16),
            const Text(
              'Note:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text(
              '1. Shop will not be visible to customers if you have no products added!\n'
              '2. Add products at menu price to avoid items being delisted in the future!',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ElevatedButton(
        onPressed: () {
          if (title == 'Packaging & Delivery') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PackagingDeliveryScreen(),
              ),
            );
          } else if (title == 'Products') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ProductDetailsScreen(baseUrl: widget.baseUrl),
              ),
            );
          }
          // Handle other button presses
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          side: const BorderSide(color: Colors.grey),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}
