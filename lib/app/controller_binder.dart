import 'package:get/get.dart';
import 'package:ostadecommerce/app/controller/auth_controller.dart';
import 'package:ostadecommerce/app/set_up_network_client.dart';
import 'package:ostadecommerce/features/auth/presentation/controllers/login_controller.dart';
import 'package:ostadecommerce/features/auth/presentation/controllers/sign_up_controller.dart';
import 'package:ostadecommerce/features/auth/presentation/controllers/verify_otp_controller.dart';
import 'package:ostadecommerce/features/home/presentation/controllers/home_slides_controller.dart';
import 'package:ostadecommerce/features/products/presentation/controllers/product_details_controller.dart';
import 'package:ostadecommerce/features/products/presentation/controllers/product_list_controller.dart';
import 'package:ostadecommerce/features/shared/presentation/controllers/category_controller.dart';
import 'package:ostadecommerce/features/shared/presentation/controllers/main_nav_controller.dart';

class ControllerBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(MainNavController());
    Get.put(setUpNetworkClient());
    Get.put(SignUpController());
    Get.put(VerifyOtpController());
    Get.put(AuthController());
    Get.put(LogInController());
    Get.put(HomeSliderController());
    Get.put(CategoryController());
    Get.put(ProductListController());
    Get.put(ProductDetailsController());
  }
}
