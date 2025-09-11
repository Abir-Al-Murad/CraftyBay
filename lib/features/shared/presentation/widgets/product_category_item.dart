import 'package:flutter/material.dart';
import 'package:ostadecommerce/app/app_colors.dart';

class ProductCategoryItem extends StatelessWidget {
  const ProductCategoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: AppColors.themeColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(8)
          ),
          child: Icon(Icons.computer,size: 32,color: AppColors.themeColor,),
        ),
        Text("Electronics",style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.themeColor),),
      ],
    );
  }
}
