import 'package:flutter/material.dart';
import 'package:ostadecommerce/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:ostadecommerce/features/auth/presentation/screens/splash_screen.dart';
import 'package:ostadecommerce/features/shared/presentation/screens/bottom_nav_holder.dart';

import '../features/auth/presentation/screens/sign_in_screen.dart';
import '../features/auth/presentation/screens/verify_otp.dart';

MaterialPageRoute onGenerateRoute(RouteSettings settings){
  late Widget screen;
  if(settings.name == SplashScreen.name){
    screen = SplashScreen();
  }else if(settings.name == SignInScreen.name){
    screen = SignInScreen();
  }else if(settings.name == SignUpScreen.name){
    screen = SignUpScreen();
  }else if(settings.name == VerifyOtpScreen.name){
    screen = VerifyOtpScreen();
  }else if(settings.name == BottomNavHolder.name){
    screen = BottomNavHolder();
  }

  return MaterialPageRoute(builder: (ctx)=>screen);
}