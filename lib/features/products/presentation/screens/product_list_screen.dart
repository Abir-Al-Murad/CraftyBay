import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadecommerce/features/products/presentation/controllers/product_list_controller.dart';
import 'package:ostadecommerce/features/shared/data/models/catetgory_model.dart';
import 'package:ostadecommerce/features/shared/presentation/screens/product_card.dart';
import 'package:ostadecommerce/features/shared/presentation/widgets/centered_circuler_progress.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.categoryModel});

  static const String name = '/product-list';

  final CategoryModel categoryModel;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  final ScrollController _scrollController = ScrollController();
  final ProductListController _productListController = Get.find<ProductListController>();


  @override
  void initState() {
    _scrollController.addListener(_loadMoreData);
    WidgetsBinding.instance.addPostFrameCallback((_){
      _productListController.refreshProductList(widget.categoryModel.id);
      _productListController.getProductListByCategory(widget.categoryModel.id);
    });
    super.initState();
  }

  void _loadMoreData(){
    if(_scrollController.position.extentAfter<400){
      _productListController.getProductListByCategory(widget.categoryModel.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.categoryModel.title)),

      body: GetBuilder(
        init: _productListController,
        builder: (controller) {
          if(controller.isInitialLoading){
            return CenteredCirculerProgress();
          }
          return Column(
            children: [
              Expanded(
                child: GetBuilder(
                  init: _productListController,
                  builder: (controller) {
                    return GridView.builder(
                      controller: _scrollController,
                      itemCount: controller.productList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 8
                      ),
                      itemBuilder: (context, index) {
                        return FittedBox(child: ProductCard(productModel: controller.productList[index],));
                      },
                    );
                  }
                ),
              ),
              Visibility(
                  visible: controller.getProductListInProgress,
                  child: LinearProgressIndicator()),
            ],
          );
        }
      ),
    );
  }
}
