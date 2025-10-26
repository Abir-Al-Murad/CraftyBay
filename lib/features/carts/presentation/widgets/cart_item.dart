import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadecommerce/features/carts/presentation/controllers/cart_list_controllers.dart';
import 'package:ostadecommerce/features/shared/presentation/widgets/centered_circuler_progress.dart';
import 'package:ostadecommerce/features/shared/presentation/widgets/snack_bar_message.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/utils/constants.dart';
import '../../../shared/presentation/widgets/increment_decrement_button.dart';
import '../../data/model/cart_item_model.dart' show CartItemModel;

class CartItem extends StatefulWidget {
  const CartItem({super.key, required this.cartItemModel});
  final CartItemModel cartItemModel;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {

  final CartListControllers _cartListControllers = Get.find<CartListControllers>();
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
              widget.cartItemModel.product.photos.isEmpty
                  ? ''
                  : widget.cartItemModel.product.photos.first,
              height: 80,
              width: 80,
              errorBuilder: (_, __, ___) {
                return Container(
                  alignment: Alignment.center,
                  height: 80,
                  width: 80,
                  child: Icon(Icons.error_outline, size: 32),
                );
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
                              widget.cartItemModel.product.title,
                              style: TextTheme.of(context).titleSmall,
                            ),
                            Text(
                              "Size: ${widget.cartItemModel.size ?? 'Nil'}   Color: ${widget.cartItemModel.color ?? 'Nil'}",
                              style: TextTheme.of(context).bodySmall,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          print("Delete");
                          _onTapDelete(context);
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$takaSign${widget.cartItemModel.product.currentPrice}',
                        style: TextTheme.of(
                          context,
                        ).titleSmall?.copyWith(color: AppColors.themeColor),
                      ),
                      IncrementDecrementButton(
                        onChange: (int value) {
                          Get.find<CartListControllers>().updateCart(
                            widget.cartItemModel.id,
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

  void _onTapDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.spaceBetween,

          content: Text("Do you want to remove this product form cart?"),
          title: Text("Delete Item"),
          actions: [
            SizedBox(
              width: 100,
              child: GetBuilder<CartListControllers>(
                builder: (controller) {
                  if(controller.inProgree) {
                    return CenteredCirculerProgress();
                  }
                  return FilledButton(onPressed: () async{
                    bool isSuccess = await controller.deleteCartItem(widget.cartItemModel.id);
                    if (isSuccess) {
                      controller.getCartList();
                      showSnackBarMessage(context, "Successfully Item Deleted");
                    } else {
                      showSnackBarMessage(context, controller.errorMessage ?? "Something went wrong");
                    }
                    Navigator.pop(context);
                  }, child: Text("Delete"));
                }
              ),
            ),
            SizedBox(
              width: 100,
              child: FilledButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: AppColors.themeColor),
                  ),
                ),
                child: Text("Cancel"),
              ),
            ),
          ],
        );
      },
    );
  }
}
