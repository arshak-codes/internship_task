const express = require('express');
const router = express.Router();
const Product = require('../models/Product');

// Get all products
router.get('/', async (req, res) => {
  try {
    const products = await Product.find().lean();
    // Format the date for each product with a specific format
    const formattedProducts = products.map(product => ({
      ...product,
      addedOn: product.addedOn ? new Date(product.addedOn).toLocaleDateString('en-GB', {
        day: '2-digit',
        month: '2-digit',
        year: 'numeric'
      }) : 'N/A'
    }));
    res.json(formattedProducts);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});

// Add new product
router.post('/', async (req, res) => {
  const product = new Product({
    ...req.body,
    addedOn: new Date() // Ensure date is set when creating
  });
  try {
    const newProduct = await product.save();
    // Format the date before sending response
    const formattedProduct = {
      ...newProduct.toObject(),
      addedOn: newProduct.addedOn.toLocaleDateString('en-GB', {
        day: '2-digit',
        month: '2-digit',
        year: 'numeric'
      })
    };
    res.status(201).json(formattedProduct);
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
});

// Update product
router.put('/:id', async (req, res) => {
  try {
    const product = await Product.findByIdAndUpdate(
      req.params.id,
      req.body,
      { new: true }
    );
    res.json(product);
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
});

module.exports = router; 