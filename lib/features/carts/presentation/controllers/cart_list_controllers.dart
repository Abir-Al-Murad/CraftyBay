import 'package:get/get.dart';
import 'package:ostadecommerce/app/urls.dart';
import 'package:ostadecommerce/core/models/network_response.dart';
import 'package:ostadecommerce/core/services/network_caller.dart';
import 'package:ostadecommerce/features/carts/data/model/cart_item_model.dart';
import 'package:ostadecommerce/features/shared/presentation/widgets/snack_bar_message.dart';

class CartListControllers extends GetxController{
  bool _inProgress = false;
  bool get inProgree => _inProgress;

  List<CartItemModel> _cartItemModel = [];
  List<CartItemModel> get cartItemModel => _cartItemModel;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;


  Future<bool> getCartList()async{
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(url: Urls.cartListUrl);

    if(response.isSuccess){
      _errorMessage = null;
      isSuccess = true;
      List<CartItemModel> list = [];

      for(Map<String,dynamic>jsonData in response.body!['data']['results']){
        list.add(CartItemModel.formJson(jsonData));
      }
      _cartItemModel = list;
    }else{
      _errorMessage = response.errorMessage;
      isSuccess = false;
    }
    _inProgress = false;
    update();
    return isSuccess;

  }
  Future<bool> deleteCartItem(String cartItemId) async {
    bool isDeletionSuccess = false;
    bool deletionInProgress = true;
    _errorMessage = null;
    update();
    NetworkResponse response = await Get.find<NetworkCaller>().deleteRequest(url: Urls.deleteCartItemUrl(cartItemId));
    if(response.isSuccess){
      isDeletionSuccess = true;
      _errorMessage = null;
    }else{
      isDeletionSuccess = false;
      _errorMessage = response.errorMessage;
    }
    deletionInProgress = false;
    update();
    return isDeletionSuccess;
  }

  int get totalPrice{
    int total = 0;
    for (CartItemModel item in _cartItemModel){
      total += item.quantity * item.product.currentPrice;
    }
    return total;
  }
  void updateCart(String cartItemId,int quantity){
    _cartItemModel.firstWhere((item)=>item.id == cartItemId).quantity=quantity;
    update();
  }

}