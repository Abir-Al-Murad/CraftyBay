import 'package:flutter/material.dart';
import 'package:ostadecommerce/app/app_colors.dart';
import 'package:ostadecommerce/app/utils/constants.dart';

class TotalPriceAndCheckoutSection extends StatelessWidget {
  const TotalPriceAndCheckoutSection({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final TextTheme theme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.themeColor.withOpacity(0.1),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Price",style: TextStyle(
                  color: Colors.black,fontWeight: FontWeight.w600
              ),),
              Text("${takaSign}100",style: theme.titleMedium?.copyWith(
                  color: AppColors.themeColor
              ),),
            ],
          ),
          SizedBox(
              width: 120,
              child: FilledButton(onPressed: (){}, child:Text("Add to Cart"))),
        ],
      ),
    );
  }
}
