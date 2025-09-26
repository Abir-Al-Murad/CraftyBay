import 'package:flutter/material.dart';
import 'package:ostadecommerce/features/shared/presentation/screens/product_card.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.categoryName});

  static const String name = '/product-list';

  final String categoryName;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.categoryName)),

      body: GridView.builder(
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8
        ),
        itemBuilder: (context, index) {
          return FittedBox(child: ProductCard());
        },
      ),
    );
  }
}
