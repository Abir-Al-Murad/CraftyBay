import 'package:get/get.dart';
import 'package:ostadecommerce/app/urls.dart';
import 'package:ostadecommerce/core/models/network_response.dart';
import 'package:ostadecommerce/core/services/network_caller.dart';
import 'package:ostadecommerce/features/shared/data/models/product_details_model.dart';

class ProductDetailsController extends GetxController{
    bool _getProductDetailsInProgress = false;
    bool get getProductDetailsInProgress => _getProductDetailsInProgress;
    ProductDetailsModel? _productDetailsModel;
    String? _errorMessage;

    ProductDetailsModel? get productDetailsModel => _productDetailsModel;
    String? get errorMessage => _errorMessage;

    Future<bool> getProductDetails(String productId)async{
      _getProductDetailsInProgress = true;
      bool isSuccess = false;
      update();
      final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(url: Urls.prouductDetailsUrl(productId));
      if(response.isSuccess){
        isSuccess = true;
        _errorMessage = null;
        _productDetailsModel = ProductDetailsModel.formJson(response.body!['data']);
      }else{
        _errorMessage = response.errorMessage;
      }
      _getProductDetailsInProgress =false;
      update();
      return isSuccess;
    }
}