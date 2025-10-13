import 'package:flutter/material.dart';
import 'package:ostadecommerce/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:ostadecommerce/features/auth/presentation/screens/splash_screen.dart';
import 'package:ostadecommerce/features/products/presentation/screens/product_details_screen.dart';
import 'package:ostadecommerce/features/products/presentation/screens/product_list_screen.dart';
import 'package:ostadecommerce/features/shared/presentation/screens/bottom_nav_holder.dart';
import 'package:ostadecommerce/features/wishlist/presentation/screens/wish_list_screen.dart';

import '../features/auth/presentation/screens/sign_in_screen.dart';
import '../features/auth/presentation/screens/verify_otp_screen.dart';

MaterialPageRoute onGenerateRoute(RouteSettings settings){
  late Widget screen;
  if(settings.name == SplashScreen.name){
    screen = SplashScreen();
  }else if(settings.name == SignInScreen.name){
    screen = SignInScreen();
  }else if(settings.name == SignUpScreen.name){
    screen = SignUpScreen();
  }else if(settings.name == VerifyOtpScreen.name){
    final String email = settings.arguments as String;
    screen = VerifyOtpScreen(email: email,);
  }else if(settings.name == BottomNavHolder.name){
    screen = BottomNavHolder();
  }else if(settings.name == ProductListScreen.name){
    final String category = settings.arguments as String;
    screen = ProductListScreen(categoryName: category);
  }else if(settings.name == WishListScreen.name){
    screen = WishListScreen();
  }else if(settings.name == ProductDetailsScreen.name){
    screen = ProductDetailsScreen();
  }

  return MaterialPageRoute(builder: (ctx)=>screen);
}