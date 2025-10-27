import 'package:get/get.dart';
import 'package:ostadecommerce/app/urls.dart';
import 'package:ostadecommerce/core/models/network_response.dart';
import 'package:ostadecommerce/core/services/network_caller.dart';
import 'package:ostadecommerce/features/wishlist/data/wish_model.dart';

class WishListController extends GetxController{
  bool _addToWishListInProgress = false;
  bool _getWishListInProgress = false;
  bool _deleteWishInProgress = false;
  bool get addToCartInProgress => _addToWishListInProgress;
  bool get getWishListInProgress => _getWishListInProgress;
  bool get deleteWishInProgress => _deleteWishInProgress;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  List<WishModel> products = [];
  Future<bool> addToWishList(String productId)async{
    _addToWishListInProgress = true;
    bool isSuccess = false;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().postRequest(url: Urls.wishListUrl,body: {'product':productId});
    if(response.isSuccess){
      isSuccess = true;
      _errorMessage = null;
    }else{
      _errorMessage = response.errorMessage;
    }
    _addToWishListInProgress =false;
    update();
    return isSuccess;
  }

  Future<bool> getWishList()async{
    _getWishListInProgress = true;
    bool isSuccess = false;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(url: Urls.wishListUrl,);
    if(response.isSuccess){
      isSuccess = true;
      final list = List.from(response.body!['data']['results']).map((e)=>WishModel.fromJson(e)).toList();
      products = list;
      _errorMessage = null;
    }else{
      _errorMessage = response.errorMessage;
    }
    _getWishListInProgress =false;
    update();
    return isSuccess;
  }

  Future<bool> deleteWishItem(String wishId)async{
    _deleteWishInProgress = true;
    bool isSuccess = false;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().deleteRequest(url: Urls.deleteWishItemUrl(wishId),);
    if(response.isSuccess){
      isSuccess = true;
      _errorMessage = null;
    }else{
      _errorMessage = response.errorMessage;
    }
    _deleteWishInProgress =false;
    update();
    return isSuccess;
  }


}