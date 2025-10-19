import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ostadecommerce/app/app.dart';
import 'package:ostadecommerce/app/controller/auth_controller.dart';
import 'package:ostadecommerce/core/services/network_caller.dart';
import 'package:ostadecommerce/features/auth/presentation/screens/sign_in_screen.dart';

NetworkCaller setUpNetworkClient(){
  return NetworkCaller(onUnAuthorize: _onUnAuthorize, accessToken: (){
    return Get.find<AuthController>().accessToken ?? '';
  });
}

Future<void> _onUnAuthorize()async{
  //TODO: Redirect to login and remove cache
  Navigator.pushNamedAndRemoveUntil(CraftyBay.navigatorKey.currentContext!, SignInScreen.name, (predicate)=>false);
}