import 'dart:convert';
import 'package:cosysta_mt/models/products.dart';
import 'package:http/http.dart' as http;

class ProductsServices {
  static Future<List<Product>> getProducts(
      void Function(String) onError) async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      // onError('Failed to load products');

      List<dynamic> productsJson = jsonDecode(response.body);
      return productsJson.map((json) => Product.fromJson(json)).toList();
    } else {
      onError('Failed to load products');
      throw Exception('Failed to load products');
    }
  }
}
