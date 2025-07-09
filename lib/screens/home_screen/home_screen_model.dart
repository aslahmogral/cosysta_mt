import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cosysta_mt/models/products.dart';
import 'package:cosysta_mt/services/products_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenModel with ChangeNotifier {
  BuildContext context;
  TextEditingController controller = TextEditingController();
  List<Product> products = [];
  Timer? _debounce;
  String searchQuery = '';
  List<Product> filteredProducts = [];
  bool isLoading = false;

  late StreamSubscription<ConnectivityResult> _subscription;
  bool hasInternet = true;

  HomeScreenModel(this.context) {
    initialize();
  }

  Future<void> initialize() async {
    isLoading = true;
    notifyListeners();
    await loadProducts();
    hasInternet = await checkInternet();
    notifyListeners();

    if (hasInternet) {
      await getProducts();
    }

    Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) async {
      bool internetNow = await checkInternet();

      if (internetNow && !hasInternet) {
        await getProducts();
      }

      hasInternet = internetNow;
      notifyListeners();
    });
    isLoading = false;
    notifyListeners();
  }

  Future<void> loadProducts() async {
    final prefs = await SharedPreferences.getInstance();
    final String? storedProducts = prefs.getString('cached_products');
    if (storedProducts != null) {
      List<dynamic> decoded = jsonDecode(storedProducts);
      products = decoded.map((json) => Product.fromJson(json)).toList();
      filteredProducts = products;
      notifyListeners();
    }
  }

  Future<void> getProducts() async {
    try {
      products = await ProductsServices.getProducts((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error loading products: $error"),
            action: SnackBarAction(
              label: 'reload products',
              onPressed: () => getProducts(),
            ),
            duration: const Duration(days: 1),
          ),
        );
      });
      filteredProducts = products;
      final prefs = await SharedPreferences.getInstance();
      final productJsonList = products.map((p) => p.toJson()).toList();
      final encoded = jsonEncode(productJsonList);
      await prefs.setString('cached_products', encoded);

      notifyListeners();
    } catch (e) {
      print("Error in getProducts: $e");
    }
  }

  Future<bool> checkInternet() async {
    final connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult[0] == ConnectivityResult.none) {
      return false;
    }

    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  void updateSearchQuery(String query) {
    searchQuery = query;

    _debounce?.cancel(); // cancel previous timer

    _debounce = Timer(Duration(milliseconds: 500), () {
      if (query.isEmpty) {
        filteredProducts = products;
      } else {
        filteredProducts = products
            .where((product) =>
                product.title.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    _debounce?.cancel();
    super.dispose();
  }
}
