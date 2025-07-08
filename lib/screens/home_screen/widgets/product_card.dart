import 'package:cosysta_mt/utils/app_theme.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String star;
  final String reviews;
  final String price;

  // final Widget Function() route;

  const ProductCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.star,
    required this.reviews,
    required this.price,
    // required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 2.0, vertical: 12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 80,
                width: 80,
                child: Image.network(imagePath),
              ),
              SizedBox(
                width: 24,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      title,
                      style: AppTheme.textStyles.customContainer.copyWith(
                          fontSize: 16, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
    
                      // style: AppTheme.textStyles.customContainer
                      //     .copyWith(fontSize: 22),
                    ),
                    Row(
                      children: [
                        Text('$star ⭐ ($reviews reviews)'),
                        Expanded(child: SizedBox()),
                        Text(
                          'Rs $price',
                          style: AppTheme.textStyles.customContainer.copyWith(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 8,
                        )
                      ],
                    ),
                    //  Text(
                    //   'description',
                    //   // style: AppTheme.textStyles.customContainer
                    //   //     .copyWith(fontSize: 22),
                    // ),
                  ],
                ),
              ),
              // Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
