import 'package:get/get.dart';
import 'package:ostadecommerce/app/urls.dart';
import 'package:ostadecommerce/core/models/network_response.dart';
import 'package:ostadecommerce/core/services/network_caller.dart';
import 'package:ostadecommerce/features/auth/data/models/sign_up_request_model.dart';

class SignUpController extends GetxController{
  bool _SignUpInProgress = false;
  bool get signUpInProgress => _SignUpInProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> signUp(SignUpRequestModel model)async{
    bool isSuccess = false;
    _SignUpInProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().postRequest(url: Urls.signUpUrl,body: model.toJson());
    if(response.isSuccess){
      _errorMessage = null;
      isSuccess = true;
    }else{
      _errorMessage = response.body?['msg']??response.errorMessage;
    }

    _SignUpInProgress = false;
    update();
    return isSuccess;

  }
}