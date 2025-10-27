import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadecommerce/app/app_colors.dart';
import 'package:ostadecommerce/app/utils/constants.dart';
import 'package:ostadecommerce/features/products/presentation/screens/product_details_screen.dart';
import 'package:ostadecommerce/features/shared/data/models/product_model.dart';
import 'package:ostadecommerce/features/shared/presentation/controllers/wish_list_controller.dart';
import 'package:ostadecommerce/features/shared/presentation/widgets/snack_bar_message.dart';
import 'package:ostadecommerce/features/wishlist/data/wish_model.dart';

class WishCard extends StatelessWidget {
  const WishCard({
    super.key,
    required this.wishModel
  });

  final WishModel wishModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductDetailsScreen.name,arguments: wishModel.productId);
      },
      child: Card(
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
                child: Image.network(
                  wishModel.photos.firstOrNull ?? '',
                  height: 80,
                  width: 140,
                  errorBuilder: (_,__,___){
                    return SizedBox(
                        height: 80,
                        width: 140,
                        child: Icon(Icons.error_outline,size: 48,color: Colors.green,));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  spacing: 4,
                  children: [
                    Text(
                      wishModel.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${takaSign}${wishModel.currentPrice}",
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
                            Text(wishModel.rating.toString()),
                          ],
                        ),
                        GestureDetector(
                          onTap: () async {
                            bool isSuccess = await Get.find<WishListController>().deleteWishItem(wishModel.wishId);
                            if(isSuccess){
                              Get.find<WishListController>().getWishList();
                              showSnackBarMessage(context, "Item Removed form WishList");
                            }else{
                              showSnackBarMessage(context, 'Failed');
                            }
                          },
                          child: Card(
                            color: AppColors.themeColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: Icon(Icons.favorite,size: 14,color: Colors.white,),
                            ),
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
      ),
    );
  }
}
