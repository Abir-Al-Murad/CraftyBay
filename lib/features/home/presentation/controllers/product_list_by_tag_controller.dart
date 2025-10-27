import 'package:get/get.dart';
import 'package:ostadecommerce/app/urls.dart';
import 'package:ostadecommerce/core/models/network_response.dart';
import 'package:ostadecommerce/core/services/network_caller.dart';
import 'package:ostadecommerce/features/shared/data/models/product_model.dart';

class ProductListByTagController extends GetxController{
  bool _inProgress = false;
  String? _errorMessage;
  List<ProductModel> _newProductList = [];
  List<ProductModel> _specialProductList = [];
  List<ProductModel> _popularProductList = [];
  
  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;
  List<ProductModel> get newProductList => _newProductList;
  List<ProductModel> get specialProductList => _specialProductList;
  List<ProductModel> get popularProductList => _popularProductList;

  Future<bool> getProductListByTag(String tag)async{
    bool isSuccess = false;
    _inProgress = true;
    update();
    List<ProductModel> products = [];
    NetworkResponse response = await Get.find<NetworkCaller>().getRequest(url: Urls.productListByTagUrl(tag));
    if(response.isSuccess){
      for(Map<String,dynamic>jsonData in response.body!['data']['results']){
        products.add(ProductModel.fromJson(jsonData));
      }
      if (tag == 'new') {
        _newProductList = products;
      } else if (tag == 'special') {
        _specialProductList = products;
      } else if (tag == 'popular') {
        _popularProductList = products;
      }
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