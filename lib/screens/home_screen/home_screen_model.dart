import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cosysta_mt/models/products.dart';
import 'package:cosysta_mt/services/products_services.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenModel with ChangeNotifier {
  List<Product> products = [];

  late StreamSubscription<ConnectivityResult> _subscription;
  bool hasInternet = true;

  HomeScreenModel() {
    initialize();
  }

  Future<void> initialize() async {
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

  Future<bool> checkInternet() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    // if ([ConnectivityResult.none].contains(connectivityResult)) {
    //   return false;
    // }
    if(connectivityResult[0] == ConnectivityResult.none){
      return false;
    }

    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
