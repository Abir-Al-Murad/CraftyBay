import 'package:get/get.dart';
import 'package:ostadecommerce/app/urls.dart';
import 'package:ostadecommerce/core/models/network_response.dart';
import 'package:ostadecommerce/core/services/network_caller.dart';
import 'package:ostadecommerce/features/shared/data/models/product_model.dart';

class ProductListController extends GetxController{
  bool _getProductListInProgress = false;
  bool _isInitialLoading = false;

  final List<ProductModel> _productList = [];
  String? _errorMessage;

  int _currentPage = 0;
  int pageSize = 40; //1st e kotogula element load hobe
  int? _lastPage;

  bool get getProductListInProgress => _getProductListInProgress;
  bool get isInitialLoading => _isInitialLoading;

  List<ProductModel> get productList => _productList;

  String? get errorMessage => _errorMessage;

  Future<bool> getProductListByCategory(String categoryId)async{
    bool isSuccess = false;
    if(_currentPage > (_lastPage??1)){
      return false;
    }
    if(_currentPage ==0){
      _productList.clear();
      _isInitialLoading = true;
    }else{
      _getProductListInProgress = true;
    }
    _currentPage++;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(url: Urls.productListUrl(pageSize, _currentPage,categoryId));

    if(response.isSuccess){
      _errorMessage = null;
      List<ProductModel> list = [];
      _lastPage = response.body!['data']['last_page'];
      for(Map<String,dynamic>jsonData in response.body!['data']['results']){
        list.add(ProductModel.fromJson(jsonData));
      }
      _productList.addAll(list);
      isSuccess = true;
    }else{
      isSuccess = false;
      _errorMessage = response.errorMessage;
    }

    if(_isInitialLoading){
      _isInitialLoading = false;
    }else{
      _getProductListInProgress = false;
    }
    update();
    return isSuccess;

  }


  Future<void> refreshProductList(String categoryId)async{
    _currentPage = 0;
    await getProductListByCategory(categoryId);
  }
}