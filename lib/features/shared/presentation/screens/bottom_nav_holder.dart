import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadecommerce/features/carts/presentation/screens/cart_screen.dart';
import 'package:ostadecommerce/features/category/presentation/screens/category_list_screen.dart';
import 'package:ostadecommerce/features/home/presentation/controllers/home_slides_controller.dart';
import 'package:ostadecommerce/features/home/presentation/screens/home_screen.dart';
import 'package:ostadecommerce/features/shared/presentation/controllers/main_nav_controller.dart';
import 'package:ostadecommerce/features/wishlist/presentation/screens/wish_list_screen.dart';

class BottomNavHolder extends StatefulWidget {
  const BottomNavHolder({super.key});

  static const String name = '/bottom-nav-holder';

  @override
  State<BottomNavHolder> createState() => _BottomNavHolderState();
}

class _BottomNavHolderState extends State<BottomNavHolder> {

  final List<Widget> _screens = [
    HomeScreen(),
    CategoryListScreen(),
    CartScreen(),
    WishListScreen(),
  ];

  @override
  void initState() {
    Get.find<HomeSliderController>().getHomeSliders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainNavController>(
      builder: (mainNavController) {
        return Scaffold(
          body: _screens[mainNavController.currentIndex],
          bottomNavigationBar: NavigationBar(
            selectedIndex: mainNavController.currentIndex,
              onDestinationSelected: mainNavController.changeIndex,
              destinations: [
                NavigationDestination(icon: Icon(Icons.home), label: "Home"),
                NavigationDestination(icon: Icon(Icons.dashboard_customize_outlined), label: "Categories"),
                NavigationDestination(icon: Icon(Icons.shopping_cart_checkout), label: "Cart"),
                NavigationDestination(icon: Icon(Icons.favorite_border_outlined), label: "Favourite"),
              ])
        );
      }
    );
  }
}
