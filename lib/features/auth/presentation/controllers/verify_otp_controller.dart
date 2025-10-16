import 'package:get/get.dart';
import 'package:ostadecommerce/app/urls.dart';
import 'package:ostadecommerce/core/models/network_response.dart';
import 'package:ostadecommerce/core/services/network_caller.dart';
import 'package:ostadecommerce/features/shared/data/models/user_model.dart';
import 'package:ostadecommerce/features/auth/data/models/verify_otp_request_model.dart';

class VerifyOtpController extends GetxController{
  bool _verifyOtpInProgress = false;
  bool get verifyOtpInProgress => _verifyOtpInProgress;
  UserModel? get userModel => _userModel;
  String? get accessToken => _accessToken;

  UserModel? _userModel;
  String? _accessToken;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> verifyOtp(VerifyOtpRequestModel model)async{
    bool isSuccess = false;
    _verifyOtpInProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().postRequest(url: Urls.verifyOtpUrl,body: model.toJson());
    if(response.isSuccess){
      _errorMessage = null;
      _userModel = UserModel.fromJson(response.body!['data']['user']);
      _accessToken = response.body!['user']['token'];
      isSuccess = true;
    }else{
      _errorMessage = response.body?['msg']??response.errorMessage;
    }

    _verifyOtpInProgress = false;
    update();
    return isSuccess;

  }
}