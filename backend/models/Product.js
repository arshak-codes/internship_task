const mongoose = require('mongoose');

const productSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true
  },
  description: {
    type: String,
    required: true
  },
  foodPreference: {
    type: String,
    required: true
  },
  inStock: {
    type: Boolean,
    default: true
  },
  servingInformation: String,
  note: String,
  images: [String],
  priceChart: [{
    flavour: String,
    size: String,
    price: Number
  }],
  customizations: [{
    name: String,
    options: [String],
    price: Number
  }],
  createdAt: {
    type: Date,
    default: Date.now
  }
});

module.exports = mongoose.model('Product', productSchema); 