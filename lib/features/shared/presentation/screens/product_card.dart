import 'package:flutter/material.dart';
import 'package:ostadecommerce/app/app_colors.dart';
import 'package:ostadecommerce/app/assests_paths.dart';
import 'package:ostadecommerce/app/utils/constants.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shadowColor: AppColors.themeColor.withOpacity(0.1),
      child: SizedBox(
        width: 140,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: AppColors.themeColor.withOpacity(0.1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8))
              ),
              child: Image.asset(
                AssetPaths.dummyShoePng,
                height: 80,
                width: 140,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                spacing: 4,
                children: [
                  Text(
                    'Nike Air Jordan A45GH',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${takaSign}120",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.themeColor,
                        ),
                      ),
                      Wrap(
                        children: [
                          Icon(
                            Icons.star,
                            size: 18,
                            color: Colors.amber,
                          ),
                          Text('4.2'),
                        ],
                      ),
                      Card(
                        color: AppColors.themeColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Icon(Icons.favorite_outline,size: 14,color: Colors.white,),
                        ),
                      )

                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
