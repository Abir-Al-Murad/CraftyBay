import 'package:get/get.dart';
import 'package:ostadecommerce/app/urls.dart';
import 'package:ostadecommerce/core/models/network_response.dart';
import 'package:ostadecommerce/core/services/network_caller.dart';
import 'package:ostadecommerce/features/shared/data/models/product_model.dart';

class ProductListByTagController extends GetxController{
  bool _inProgress = false;
  String? _errorMessage;
  List<ProductModel> _productList = [];
  
  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;
  List<ProductModel> get productList => _productList;
  
  Future<bool> getProductListByTag(String tag)async{
    bool isSuccess = false;
    _inProgress = true;
    List<ProductModel> list = [];
    update();
    NetworkResponse response = await Get.find<NetworkCaller>().getRequest(url: Urls.productListByTagUrl(tag));
    if(response.isSuccess){
      for(Map<String,dynamic>json in response.body!['data']['results']){
        list.add(ProductModel.fromJson(json));
      }
      _productList = list;
      isSuccess = true;
      _errorMessage = null;
    }else{
      isSuccess = false;
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }

}