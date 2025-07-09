import 'package:cosysta_mt/screens/home_screen/home_screen_model.dart';
import 'package:cosysta_mt/screens/home_screen/widgets/product_card.dart';
import 'package:cosysta_mt/screens/product_detail_screen.dart/product_detail_screen.dart';
import 'package:cosysta_mt/screens/product_detail_screen.dart/product_detail_screen_model.dart';
import 'package:cosysta_mt/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeScreenModel(),
      child: Consumer<HomeScreenModel>(
        builder: (context, model, child) {
          return Scaffold(
            // appBar: AppBar(
            //   title: SearchBar()
            // ),
            body: Padding(
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
                    child: model.products.isEmpty
                        ? Center(child: Text("No products available"))
                        : ListView.builder(
                            itemCount: model.products.length + 1,
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: CustomSearchBar(
                                    onSearchTap: () {},
                                  ),
                                );
                              }
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ProductDetailScreen(
                                        product: model.products[index - 1],
                                      ),
                                    ),
                                  );
                                },
                                child: ProductCard(
                                  imagePath: model.products[index - 1].image,
                                  title: model.products[index - 1].title,
                                  description:
                                      model.products[index - 1].description,
                                  star: model.products[index - 1].rating.rate
                                      .toString(),
                                  reviews: model
                                      .products[index - 1].rating.count
                                      .toString(),
                                  price: model.products[index - 1].price
                                      .toString(),
                                ),
                                // child: ListTile(
                                //   leading: CircleAvatar(
                                //     backgroundImage: NetworkImage(
                                //         model.products[index - 1].image),
                                //   ),
                                //   title: Text(model.products[index - 1].title),
                                //   subtitle: Text(
                                //       model.products[index - 1].description),
                                // ),
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
