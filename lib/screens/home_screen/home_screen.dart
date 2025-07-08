import 'package:cosysta_mt/screens/home_screen/home_screen_model.dart';
import 'package:cosysta_mt/screens/product_detail_screen.dart/product_detail_screen_model.dart';
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
              child: ListView.builder(
                itemCount: model.products.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return SearchBar();
                  }
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsScreen(
                            product: model.products[index - 1],
                          ),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(model.products[index - 1].image),
                      ),
                      title: Text(model.products[index - 1].title),
                      subtitle: Text(model.products[index - 1].description),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
