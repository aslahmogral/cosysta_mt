import 'package:cosysta_mt/models/products.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        
      ),
      body: Center(
        child: Column(
          children: [
            Text('Product Details'),
            Text('id : ${product.id}'),
            Text('title  : ${product.title}'),
            Text('description : ${product.description}'),
            Text('price : ${product.price}'),
            Text('rating : ${product.rating}'),
            Text('category : ${product.category}'),
          ],
        ),
      ),
    );
  }
}