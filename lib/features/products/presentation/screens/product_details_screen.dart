import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadecommerce/app/app_colors.dart';
import 'package:ostadecommerce/features/products/presentation/controllers/product_details_controller.dart';
import 'package:ostadecommerce/features/products/presentation/widgets/color_picker.dart';
import 'package:ostadecommerce/features/products/presentation/widgets/product_image_slider.dart';
import 'package:ostadecommerce/features/products/presentation/widgets/size_picker.dart';
import 'package:ostadecommerce/features/products/presentation/widgets/total_price_and_cart_section.dart';
import 'package:ostadecommerce/features/shared/presentation/widgets/centered_circuler_progress.dart';
import 'package:ostadecommerce/features/shared/presentation/widgets/increment_decrement_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key,required this.productId});
  final String productId;
  static const String name = '/product-details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  final ProductDetailsController _productDetailsController = Get.find<ProductDetailsController>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      _productDetailsController.getProductDetails(widget.productId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text("Product Details")),
      body: GetBuilder(
        init: _productDetailsController,
        builder: (controller) {
          if(controller.getProductDetailsInProgress){
            return CenteredCirculerProgress();
          }
          if(controller.errorMessage !=null){
            return Center(child: Text(controller.errorMessage!),);
          }
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductImageSlider(imageUrls: controller.productDetailsModel?.photos??[],),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Row(
                              spacing: 8,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.productDetailsModel?.title??'',
                                        style: theme.bodyLarge?.copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Wrap(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                size: 24,
                                                color: Colors.amber,
                                              ),
                                              Text(
                                                controller.productDetailsModel?.rating??'',
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ],
                                          ),
                                          TextButton(
                                            onPressed: () {},
                                            child: Text("Reviews"),
                                          ),
                                          Card(
                                            color: AppColors.themeColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(4),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(2),
                                              child: Icon(
                                                Icons.favorite_outline,
                                                size: 24,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 80,
                                  child: IncrementDecrementButton(
                                    onChange: (int value) {},
                                  ),
                                ),
                              ],
                            ),
                            Visibility(
                                visible: (controller.productDetailsModel?.colors ?? []).isNotEmpty,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: Text("Color", style: TextStyle(fontSize: 18)),
                                )),
                            const SizedBox(height: 8),

                            ColorPicker(
                              colors:controller.productDetailsModel?.colors??[],
                              onSelected: (String color) {},
                            ),
                            const SizedBox(height: 16),

                            Visibility(
                                visible: (controller.productDetailsModel?.sizes ?? []).isNotEmpty,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: Text("Size", style: TextStyle(fontSize: 18)),
                                )),
                            const SizedBox(height: 8),

                            SizePicker(
                              sizes: controller.productDetailsModel?.sizes??[],
                              onSelected: (String size) {},
                            ),
                            const SizedBox(height: 16),

                            Text("Description", style: TextStyle(fontSize: 18)),
                            Text(
                                controller.productDetailsModel?.description??'',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              TotalPriceAndCartSection(),
            ],
          );
        }
      ),
    );
  }
}
