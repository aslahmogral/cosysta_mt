import 'package:cosysta_mt/models/products.dart';
import 'package:cosysta_mt/screens/product_detail_screen.dart/product_detail_screen_model.dart';
import 'package:cosysta_mt/utils/app_theme.dart';
import 'package:cosysta_mt/utils/colors.dart';
import 'package:cosysta_mt/widgets/side_by_side.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductDetailScreenModel(),
      child: Consumer<ProductDetailScreenModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title:
                  Text('Product Detail', style: AppTheme.textStyles.subHeading),
            ),
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Center(
                          child: SizedBox(
                              height: 400,
                              child: Image.network(product.image.toString())),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: DraggableScrollableSheet(
                    initialChildSize: 0.4,
                    minChildSize: 0.4,
                    maxChildSize: 0.7,
                    builder: (context, scrollController) {
                      return LayoutBuilder(
                        builder: (context, constraints) {
                          return Container(
                            decoration: BoxDecoration(
                              color: AppTheme.colors.primaryColor,
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(20)),
                            ),
                            // color: AppTheme.colors.containerBg,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxHeight: constraints.maxHeight,
                                ),
                                child: SingleChildScrollView(
                                  controller: scrollController,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        decoration:
                                            AppTheme.decorations.customCard,
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: SideBySide(
                                              firstChild: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(product.title.toString(),
                                                      style: AppTheme.textStyles
                                                          .subHeading),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                      '${product.rating.rate} ⭐ (${product.rating.count} reviews)'),
                                                ],
                                              ),
                                              secondChild: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              AppTheme.colors
                                                                  .primaryColor),
                                                  onPressed: () {},
                                                  child: Text('Rs 500',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.white)))),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        product.description.toString(),
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
