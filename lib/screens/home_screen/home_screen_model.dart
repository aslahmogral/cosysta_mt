import 'dart:convert';

import 'package:cosysta_mt/models/products.dart';
import 'package:cosysta_mt/services/products_services.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenModel with ChangeNotifier {
  List<Product> products = [];
  HomeScreenModel() {
    initialize();
  }

  Future<void> initialize() async {
    await loadProducts();
    await getProducts();
  }

  Future<void> loadProducts() async {
    final prefs = await SharedPreferences.getInstance();
    final String? storedProducts = prefs.getString('cached_products');
    if (storedProducts != null) {
      List<dynamic> decoded = jsonDecode(storedProducts);
      products = decoded.map((json) => Product.fromJson(json)).toList();
      notifyListeners();
    }
  }

  Future<void> getProducts() async {
    try {
      products = await ProductsServices.getProducts();
      final prefs = await SharedPreferences.getInstance();
      final productJsonList = products.map((p) => p.toJson()).toList();
      final encoded = jsonEncode(productJsonList);
      await prefs.setString('cached_products', encoded);

      notifyListeners();
    } catch (e) {
      print("Error in getProducts: $e");
    }
  }
}
