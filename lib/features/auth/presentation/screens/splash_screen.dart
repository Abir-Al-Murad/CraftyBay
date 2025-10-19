import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadecommerce/app/controller/auth_controller.dart';
import 'package:ostadecommerce/app/extentions/localization_extension.dart';
import 'package:ostadecommerce/app/utils/app_version_service.dart';
import 'package:ostadecommerce/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:ostadecommerce/features/home/presentation/widgets/app_logo.dart';
import 'package:ostadecommerce/features/shared/presentation/screens/bottom_nav_holder.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    _movetoNextScreen();
    super.initState();
  }

  Future<void> _movetoNextScreen()async{
    await Future.delayed(Duration(seconds: 3));
    bool isUserLoggedIn = await Get.find<AuthController>().isUserAlreadyLoggedIn();
    if(isUserLoggedIn){
      await Get.find<AuthController>().loadUserData();
    }
    Navigator.pushReplacementNamed(context, BottomNavHolder.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Center(
            //   // child: Text(AppLocalizations.of(context)!.hello),
            //   child: Text(context.localization.hello),
            // ),
            // LanguageChangeSwitch(),
            Spacer(flex: 2,),
            AppLogo(),
            Spacer(flex: 1,),
            CircularProgressIndicator(),
            SizedBox(height: 25,),
            Text("${context.localization.version} ${AppVersionService.currentAppVersion}"),
            Spacer(flex: 1,),
          ]
        ),
      ),
    );
  }
}

