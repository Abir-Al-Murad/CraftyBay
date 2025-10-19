import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadecommerce/app/app_colors.dart';
import 'package:ostadecommerce/app/utils/constants.dart';
import 'package:ostadecommerce/features/carts/presentation/controllers/cart_list_controllers.dart';

class TotalPriceAndCheckoutSection extends StatefulWidget {
  const TotalPriceAndCheckoutSection({
    super.key,
  });

  @override
  State<TotalPriceAndCheckoutSection> createState() => _TotalPriceAndCheckoutSectionState();
}

class _TotalPriceAndCheckoutSectionState extends State<TotalPriceAndCheckoutSection> {

  final CartListControllers _cartListControllers = Get.find<CartListControllers>();
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
              GetBuilder<CartListControllers>(
                builder: (controller) {
                  return Text("$takaSign${controller.totalPrice}",style: theme.titleMedium?.copyWith(
                      color: AppColors.themeColor
                  ),);
                }
              ),
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
