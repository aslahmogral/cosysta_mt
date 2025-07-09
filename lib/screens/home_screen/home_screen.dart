import 'package:cosysta_mt/screens/home_screen/home_screen_model.dart';
import 'package:cosysta_mt/screens/home_screen/widgets/product_card.dart';
import 'package:cosysta_mt/screens/product_detail_screen.dart/product_detail_screen.dart';
import 'package:cosysta_mt/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeScreenModel(context),
      child: Consumer<HomeScreenModel>(
        builder: (context, model, child) {
          final products = model.filteredProducts;
          return Scaffold(
            // appBar: AppBar(
            //   title: SearchBar()
            // ),
            body:model.isLoading ? Center(child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 12,
              children: [
                CircularProgressIndicator(),
                
                Text('loading...')
              ],
            )) : Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  if (!model.hasInternet)
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      color: Colors.red,
                      child: Text(
                        "⚠ No Internet — showing cached data",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: products.length + 1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Column(
                              children: [
                                CustomSearchBar(
                                  controller: model.controller,
                                  onSearchTap: (value) =>
                                      {model.updateSearchQuery(value)},
                                ),
                                if (products.isEmpty)
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      SizedBox(height: 200),
                                      Center(child: Text("No products available")),
                                    ],
                                  )
                              ],
                            ),
                          );
                        }

                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailScreen(
                                  product: products[index - 1],
                                ),
                              ),
                            );
                          },
                          child: ProductCard(
                            imagePath: products[index - 1].image,
                            title: products[index - 1].title,
                            description: products[index - 1].description,
                            star: products[index - 1].rating.rate.toString(),
                            reviews:
                                products[index - 1].rating.count.toString(),
                            price: products[index - 1].price.toString(),
                          ),
                      
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
