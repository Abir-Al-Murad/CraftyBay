import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadecommerce/app/app_colors.dart';
import 'package:ostadecommerce/app/controller/auth_controller.dart';
import 'package:ostadecommerce/app/utils/constants.dart';
import 'package:ostadecommerce/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:ostadecommerce/features/products/presentation/controllers/add_to_cart_controller.dart';
import 'package:ostadecommerce/features/shared/data/models/product_details_model.dart';
import 'package:ostadecommerce/features/shared/data/models/product_model.dart';
import 'package:ostadecommerce/features/shared/presentation/widgets/centered_circuler_progress.dart';
import 'package:ostadecommerce/features/shared/presentation/widgets/snack_bar_message.dart';

class TotalPriceAndCartSection extends StatefulWidget {
  const TotalPriceAndCartSection({
    super.key, required this.productDetailsModel,
  });

  final ProductDetailsModel productDetailsModel;

  @override
  State<TotalPriceAndCartSection> createState() => _TotalPriceAndCartSectionState();
}

class _TotalPriceAndCartSectionState extends State<TotalPriceAndCartSection> {
  final AddToCartController _addToCartController = AddToCartController();
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
              Text("${takaSign}${widget.productDetailsModel.currentPrice}",style: theme.titleMedium?.copyWith(
                  color: AppColors.themeColor
              ),),
            ],
          ),
          GetBuilder(
            init: _addToCartController,
            builder: (controller) {
              return SizedBox(
                  width: 120,
                  child: Visibility(
                      visible: controller.addToCartInProgress == false,
                      replacement: CenteredCirculerProgress(),
                      child: FilledButton(onPressed: onTapAddToCardButton, child:Text("Add to Cart"))));
            }
          ),
        ],
      ),
    );
  }


  Future<void> onTapAddToCardButton()async{
    if(await Get.find<AuthController>().isUserAlreadyLoggedIn()){
      final bool isSuccess = await _addToCartController.addToCart(widget.productDetailsModel.id);
      if(isSuccess){
        showSnackBarMessage(context, "Added to Cart");
      }else{
        showSnackBarMessage(context, _addToCartController.errorMessage!);
      }
    }else{
      Navigator.pushNamed(context, SignInScreen.name);
    }
  }
}
