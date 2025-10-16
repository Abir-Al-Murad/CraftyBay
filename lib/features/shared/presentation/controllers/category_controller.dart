import 'package:get/get.dart';
import 'package:ostadecommerce/app/urls.dart';
import 'package:ostadecommerce/core/models/network_response.dart';
import 'package:ostadecommerce/core/services/network_caller.dart';
import 'package:ostadecommerce/features/shared/data/models/catetgory_model.dart';

class CategoryController extends GetxController{
  bool _getCategoryInProgress = false;
  bool _isInitialLoading = false;

  List<CategoryModel> _categoryList = [];
  String? _errorMessage;

  int _currentPage = 0;
  int pageSize = 40; //1st e kotogula element load hobe
  int? _lastPage;

  bool get getCategoryInProgress => _getCategoryInProgress;
  bool get isInitialLoading => _isInitialLoading;

  List<CategoryModel> get categoryList => _categoryList;

  String? get errorMessage => _errorMessage;

  Future<bool> getCategoryList()async{
    bool isSuccess = false;
    if(_currentPage > (_lastPage??1)){
      return false;
    }
    if(_currentPage ==0){
      _categoryList.clear();
      _isInitialLoading = true;
    }else{
      _getCategoryInProgress = true;
    }
    _currentPage++;
    update();
    NetworkResponse response = await Get.find<NetworkCaller>().getRequest(url: Urls.categoryListUrl(pageSize, _currentPage));

    if(response.isSuccess){
      _errorMessage = null;
      List<CategoryModel> list = [];
      _lastPage = response.body!['data']['last_page'];
      for(Map<String,dynamic>jsonData in response.body!['data']['results']){
        list.add(CategoryModel.fromJson(jsonData));
      }
      _categoryList.addAll(list);
      isSuccess = true;
    }else{
      isSuccess = false;
      _errorMessage = response.errorMessage;
    }

    if(_isInitialLoading){
      _isInitialLoading = false;
    }else{
      _getCategoryInProgress = false;
    }
    update();
    return isSuccess;

  }


  Future<void> refreshCategoryList()async{
    _currentPage = 0;
    getCategoryList();
  }
}