import 'package:get/get.dart';
import 'package:ostadecommerce/app/urls.dart';
import 'package:ostadecommerce/core/models/network_response.dart';
import 'package:ostadecommerce/core/services/network_caller.dart';
import 'package:ostadecommerce/features/review/data/models/review_model.dart';

class ReviewListController extends GetxController{
  bool _getReviewListProgress = false;
  bool _isInitialLoading = false;
  String? _errorMessage;
  final List<ReviewModel> _riviewList = [];
  bool get getReviewListProgress => _getReviewListProgress;
  bool get isInitialLoading => _isInitialLoading;
  String? get errorMessage => _errorMessage;
  List<ReviewModel> get riviewList => _riviewList;
  int? _totalReviews;
  int? get totalReviews => _totalReviews;

  bool _addReviewInProgress = false;
  bool get addReviewInProgress => _addReviewInProgress;

  int _currentPage = 0;
  int pageSize = 10;
  int? _lastPage;

  Future<bool> getReviewList(String productId)async{
    bool isSuccess = false;
    if (_lastPage != null && _currentPage >= _lastPage!) return false;
    if(_currentPage==0){
      _riviewList.clear();
      _isInitialLoading = true;
    }else{
      _getReviewListProgress = true;
    }
    _currentPage++;
    update();
    NetworkResponse response = await Get.find<NetworkCaller>().getRequest(url: Urls.reviewListUrl(pageSize, _currentPage, productId));
    if(response.isSuccess){
      _errorMessage = null;
      _totalReviews = response.body!['data']['total'];
      List<ReviewModel> list = [];
      _lastPage = response.body!['data']['last_page'];
      for(Map<String,dynamic>jsonData in response.body!['data']['results']){
        list.add(ReviewModel.fromJson(jsonData));
      }
      _riviewList.addAll(list);
      isSuccess = true;
    }else{
      _errorMessage = response.errorMessage;
      isSuccess =false;
    }
    if(_isInitialLoading){
      _isInitialLoading = false;
    }else{
      _getReviewListProgress = false;
    }
    update();
    return isSuccess;
  }

  Future<void> refreshReviewList(String productId)async{
    _currentPage = 0;
    getReviewList(productId);
  }

  Future<bool> addReview(String productId,String comment) async {
    bool isSuccess = false;
    _addReviewInProgress = true;
    update();
    Map<String,dynamic> body ={
      'product':productId,
      'comment':comment,
      'rating':4,
    };
    NetworkResponse response = await Get.find<NetworkCaller>().postRequest(url: Urls.addReviewUrl,body: body);
    if(response.isSuccess){
      _errorMessage = null;
      isSuccess = true;
    }else{
      _errorMessage = response.errorMessage;
      isSuccess = false;
    }
    _addReviewInProgress = false;
    update();
    return isSuccess;
  }

}