import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ostadecommerce/app/assests_paths.dart';
import 'package:ostadecommerce/features/home/presentation/controllers/home_slides_controller.dart';
import 'package:ostadecommerce/features/home/presentation/controllers/product_list_by_tag_controller.dart';
import 'package:ostadecommerce/features/home/presentation/widgets/home_banner_slider.dart';
import 'package:ostadecommerce/features/shared/presentation/controllers/category_controller.dart';
import 'package:ostadecommerce/features/shared/presentation/controllers/main_nav_controller.dart';
import 'package:ostadecommerce/features/shared/presentation/screens/product_card.dart';
import 'package:ostadecommerce/features/shared/presentation/widgets/app_bar_icon_button.dart';
import 'package:ostadecommerce/features/shared/presentation/widgets/centered_circuler_progress.dart';
import 'package:ostadecommerce/features/shared/presentation/widgets/product_category_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProductListByTagController _productListByTagController = Get.find<
      ProductListByTagController>();

  @override
  void initState() {
    _productListByTagController.getProductListByTag("new");
    _productListByTagController.getProductListByTag("special");
    _productListByTagController.getProductListByTag("popular");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SvgPicture.asset(AssetPaths.logoNavSvg),
        actions: [
          AppBarIconButton(ontap: () {}, iconData: Icons.person),
          AppBarIconButton(ontap: () {}, iconData: Icons.call),
          AppBarIconButton(
            ontap: () {},
            iconData: Icons.notifications_active_outlined,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              _buildSearchBar(),
              const SizedBox(height: 16),
              GetBuilder<HomeSliderController>(
                  builder: (controller) {
                    if (controller.getSliderInProgress) {
                      return SizedBox(
                          height: 180,
                          child: CenteredCirculerProgress());
                    }
                    return HomeBannerSlider(sliders: controller.sliders,);
                  }
              ),
              const SizedBox(height: 16),
              _buildSelectionHeader(
                title: 'Categories',
                onTap: () {
                  Get.find<MainNavController>().movoToCategory();
                },
              ),
              _buildCategoryList(),
              _buildSelectionHeader(title: 'New', onTap: () {}),
              _buildNewProductList(),
              _buildSelectionHeader(title: 'Special', onTap: () {}),
              _buildSpecialProductList(),
              _buildSelectionHeader(title: 'Popular', onTap: () {}),
              _buildPopularProductList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryList() {
    return SizedBox(
      height: 100,
      child: GetBuilder<CategoryController>(
          builder: (controller) {
            if (controller.isInitialLoading) {
              return CenteredCirculerProgress();
            }
            return ListView.separated(
              itemCount: controller.categoryList.length > 10 ? 10 : controller
                  .categoryList.length,
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ProductCategoryItem(
                  categoryModel: controller.categoryList[index],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 10);
              },
            );
          }
      ),
    );
  }

  Widget _buildSelectionHeader({
    required String title,
    required VoidCallback onTap,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme
            .of(context)
            .textTheme
            .titleMedium),
        TextButton(child: Text("See all"), onPressed: onTap),
      ],
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      onSubmitted: (String? text) {},
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade100,
        prefixIcon: Icon(Icons.search),
        hintText: "Search",
        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }


  Widget _buildNewProductList() {
    return SizedBox(
      height: 200,
      child: GetBuilder<ProductListByTagController>(
        builder: (controller) {
          if (controller.inProgress) {
            return const CenteredCirculerProgress();
          }

          if (controller.newProductList.isEmpty) {
            return const Center(child: Text('No new products found.'));
          }

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.newProductList.length,
            itemBuilder: (context, index) {
              final product = controller.newProductList[index];
              return Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: ProductCard(productModel: product),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildPopularProductList() {
    return SizedBox(
      height: 200,
      child: GetBuilder<ProductListByTagController>(
        builder: (controller) {
          if (controller.inProgress && controller.popularProductList.isEmpty) {
            return CenteredCirculerProgress();
          }

          if (controller.popularProductList.isEmpty) {
            return Center(child: Text('No special products found.'));
          }

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.popularProductList.length,
            itemBuilder: (context, index) {
              final product = controller.popularProductList[index];
              return Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: ProductCard(productModel: product),
              );
            },
          );
        },
      ),
    );
  }
  Widget _buildSpecialProductList() {
    return SizedBox(
      height: 200,
      child: GetBuilder<ProductListByTagController>(
        builder: (controller) {
          if (controller.inProgress && controller.specialProductList.isEmpty) {
            return CenteredCirculerProgress();
          }

          if (controller.specialProductList.isEmpty) {
            return Center(child: Text('No special products found.'));
          }

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.specialProductList.length,
            itemBuilder: (context, index) {
              final product = controller.specialProductList[index];
              return Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: ProductCard(productModel: product),
              );
            },
          );
        },
      ),
    );
  }

}

