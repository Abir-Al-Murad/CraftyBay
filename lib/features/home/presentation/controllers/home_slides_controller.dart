import 'package:get/get.dart';
import 'package:ostadecommerce/app/urls.dart';
import 'package:ostadecommerce/core/models/network_response.dart';
import 'package:ostadecommerce/core/services/network_caller.dart';
import 'package:ostadecommerce/features/home/data/models/home_slider.dart';

class HomeSliderController extends GetxController{
  bool _getSliderInProgress = false;
  String? _errorMessage;
  List<HomeSlider> _sliders = [];
  
  bool get getSliderInProgress => _getSliderInProgress;
  String? get errorMessage => _errorMessage;
  List<HomeSlider> get sliders => _sliders;
  
  Future<bool> getHomeSliders()async{
    bool isSuccess = false;
    _getSliderInProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(url: Urls.homeSlidersUrl);
    if(response.isSuccess){
      _errorMessage = null;
      isSuccess = true;
      List<HomeSlider> listOfSliders = [];
      for(Map<String,dynamic>jsonData in response.body?['data']['results']??[]){
        listOfSliders.add(HomeSlider.fromJson(jsonData));
      }
      _sliders = listOfSliders;
    }else{
      _errorMessage = response.errorMessage;
    }
    _getSliderInProgress = false;
    update();
    return isSuccess;
  }
}