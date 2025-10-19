import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadecommerce/features/carts/presentation/controllers/cart_list_controllers.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/utils/constants.dart';
import '../../../shared/presentation/widgets/increment_decrement_button.dart';
import '../../data/model/cart_item_model.dart' show CartItemModel;

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemModel});
  final CartItemModel cartItemModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 16),
      shadowColor: AppColors.themeColor.withOpacity(0.1),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(4),
            height: 100,
            width: 100,
            decoration: BoxDecoration(),
            child: Image.network(
              cartItemModel.product.photos.isEmpty
                  ? ''
                  : cartItemModel.product.photos.first,
              height: 80,
              width: 80,
              errorBuilder: (_, __, ___) {
                return Container(
                    alignment: Alignment.center,
                    height: 80,
                    width: 80,
                    child: Icon(Icons.error_outline, size: 32));
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cartItemModel.product.title,
                              style: TextTheme.of(context).titleSmall,
                            ),
                            Text(
                              "Size: ${cartItemModel.size ?? 'Nil'}   Color: ${cartItemModel.color ?? 'Nil'}",
                              style: TextTheme.of(context).bodySmall,
                            ),
                          ],
                        ),
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$takaSign${cartItemModel.product.currentPrice}',
                        style: TextTheme.of(
                          context,
                        ).titleSmall?.copyWith(color: AppColors.themeColor),
                      ),
                      IncrementDecrementButton(
                        onChange: (int value) {
                          Get.find<CartListControllers>().updateCart(
                            cartItemModel.id,
                            value,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
