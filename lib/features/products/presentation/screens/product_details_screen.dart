import 'package:flutter/material.dart';
import 'package:ostadecommerce/app/app_colors.dart';
import 'package:ostadecommerce/app/utils/constants.dart';
import 'package:ostadecommerce/features/products/presentation/widgets/color_picker.dart';
import 'package:ostadecommerce/features/products/presentation/widgets/product_image_slider.dart';
import 'package:ostadecommerce/features/products/presentation/widgets/size_picker.dart';
import 'package:ostadecommerce/features/products/presentation/widgets/total_price_and_cart_section.dart';
import 'package:ostadecommerce/features/shared/presentation/widgets/increment_decrement_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});
  static const String name = '/product-details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text("Product Details")),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductImageSlider(),
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
                                spacing: 8,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Nike A123 - New Edition of Jordan Sports",
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
                                            '4.2',
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
                        Text("Color", style: TextStyle(fontSize: 18)),
                        ColorPicker(
                          colors: ['Red', 'White', 'Black'],
                          onSelected: (String color) {},
                        ),
                        Text("Size", style: TextStyle(fontSize: 18)),
                        const SizedBox(height: 8),

                        SizePicker(
                          sizes: ['M', 'L', 'XL', 'XXL'],
                          onSelected: (String size) {},
                        ),
                        const SizedBox(height: 8),
                        Text("Description", style: TextStyle(fontSize: 18)),
                        Text(
                          '''Brighten up your workspace with the Smart LED Desk Lamp – a perfect blend of modern design and functionality. Featuring adjustable brightness levels and color temperatures, it helps reduce eye strain while studying, reading, or working. The flexible gooseneck design allows you to position light exactly where you need it. With a sleek, space-saving base and touch-sensitive controls, this lamp fits seamlessly into any home or office setup.''',
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
      ),
    );
  }
}
