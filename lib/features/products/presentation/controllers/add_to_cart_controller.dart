import 'package:get/get.dart';
import 'package:ostadecommerce/app/urls.dart';
import 'package:ostadecommerce/core/models/network_response.dart';
import 'package:ostadecommerce/core/services/network_caller.dart';
import 'package:ostadecommerce/features/shared/data/models/product_details_model.dart';

class AddToCartController extends GetxController{
  bool _addToCartInProgress = false;
  bool get addToCartInProgress => _addToCartInProgress;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> addToCart(String productId)async{
    _addToCartInProgress = true;
    bool isSuccess = false;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().postRequest(url: Urls.addToCartUrl,body: {'product':productId});
    if(response.isSuccess){
      isSuccess = true;
      _errorMessage = null;
    }else{
      _errorMessage = response.errorMessage;
    }
    _addToCartInProgress =false;
    update();
    return isSuccess;
  }
}