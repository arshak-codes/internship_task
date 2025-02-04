import 'package:flutter/material.dart';
import 'packaging_delivery_screen.dart';
import 'product_details_screen.dart';

class ManageShopScreen extends StatelessWidget {
  const ManageShopScreen({super.key});

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
              ),
              child: const Text('Add Image'),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.add_a_photo, color: Colors.red),
                ),
              ],
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
                builder: (context) => const ProductDetailsScreen(),
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
