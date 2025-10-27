import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadecommerce/features/shared/presentation/controllers/wish_list_controller.dart';
import 'package:ostadecommerce/features/shared/presentation/widgets/centered_circuler_progress.dart';
import 'package:ostadecommerce/features/wishlist/presentation/widgets/wish_card.dart';

import '../../../shared/presentation/screens/product_card.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  static const String name = '/wish-list';


  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  
  
  final WishListController _wishListController = Get.find<WishListController>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      _wishListController.getWishList();
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Wish List")),

      body: GetBuilder<WishListController>(
        builder: (controller) {
          if(controller.getWishListInProgress){
            return CenteredCirculerProgress();
          }
          if(controller.products.isEmpty){
            return Center(child: Text("Your WishList is Empty"),);
          }
          return GridView.builder(
            itemCount: controller.products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8
            ),
            itemBuilder: (context, index) {
              return FittedBox(child: WishCard(wishModel: controller.products[index]));
            },
          );
        }
      ),
    );
  }
}
