import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ostadecommerce/app/assests_paths.dart';
import 'package:ostadecommerce/features/home/presentation/widgets/home_banner_slider.dart';
import 'package:ostadecommerce/features/shared/presentation/controllers/main_nav_controller.dart';
import 'package:ostadecommerce/features/shared/presentation/screens/product_card.dart';
import 'package:ostadecommerce/features/shared/presentation/widgets/app_bar_icon_button.dart';
import 'package:ostadecommerce/features/shared/presentation/widgets/product_category_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              HomeBannerSlider(),
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
              _buildSelectionHeader(title: 'New', onTap: () {}),
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
      child: ListView.separated(
        itemCount: 10,
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProductCategoryItem();
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 10);
        },
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
        Text(title, style: Theme.of(context).textTheme.titleMedium),
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


  Widget _buildNewProductList(){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          1,2,3,4,5
        ].map((e){
          return ProductCard();
        }).toList(),
      ),
    );
  }
  Widget _buildPopularProductList(){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,

      child: Row(
        children: [
          1,2,3,4,5
        ].map((e){
          return ProductCard();
        }).toList(),
      ),
    );
  }
  Widget _buildSpecialProductList(){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,

      child: Row(
        children: [
          1,2,3,4,5
        ].map((e){
          return ProductCard();
        }).toList(),
      ),
    );
  }
}

