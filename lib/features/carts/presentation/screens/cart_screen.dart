import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadecommerce/app/app_colors.dart';
import 'package:ostadecommerce/app/assests_paths.dart';
import 'package:ostadecommerce/app/utils/constants.dart';
import 'package:ostadecommerce/features/carts/data/model/cart_item_model.dart';
import 'package:ostadecommerce/features/carts/presentation/controllers/cart_list_controllers.dart';
import 'package:ostadecommerce/features/carts/presentation/widgets/total_price_and_checkout_section.dart';
import 'package:ostadecommerce/features/products/presentation/widgets/total_price_and_cart_section.dart';
import 'package:ostadecommerce/features/shared/presentation/widgets/increment_decrement_button.dart';

import '../widgets/cart_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  final CartListControllers _cartListControllers = Get.find<CartListControllers>();


  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      _cartListControllers.getCartList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: GetBuilder(
        init: _cartListControllers,
        builder: (controller) {

          if(controller.inProgree){
            return CircularProgressIndicator();
          }else if(controller.errorMessage !=null){
            return Center(child: Text(controller.errorMessage!),);
          }
          return Column(
            children: [
              Expanded(child: ListView.separated(
                  itemCount: controller.cartItemModel.length,
                  itemBuilder: (context,index){
                return CartItem(
                  cartItemModel: controller.cartItemModel[index],
                );
              }, separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 8,
                    );
              },)),
              TotalPriceAndCheckoutSection(),

            ],
          );
        }
      ),
    );
  }
}

