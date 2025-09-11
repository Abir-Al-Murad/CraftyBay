import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadecommerce/features/shared/presentation/controllers/main_nav_controller.dart';
import 'package:ostadecommerce/features/shared/presentation/widgets/product_category_item.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_,__){    //system navigation diye back dileo Home e ashbe
        _backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Categories"),
          leading: BackButton(onPressed: () {
            _backToHome();
          }),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              return FittedBox(child: ProductCategoryItem());
            },
          ),
        ),
      ),
    );
  }

  void _backToHome(){
    Get.find<MainNavController>().backToHome();
  }
}
