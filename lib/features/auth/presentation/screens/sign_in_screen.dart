import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadecommerce/app/controller/auth_controller.dart';
import 'package:ostadecommerce/app/extentions/localization_extension.dart';
import 'package:ostadecommerce/features/auth/data/models/login_request_model.dart';
import 'package:ostadecommerce/features/auth/presentation/controllers/login_controller.dart';
import 'package:ostadecommerce/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:ostadecommerce/features/home/presentation/widgets/app_logo.dart' show AppLogo;
import 'package:ostadecommerce/features/shared/presentation/screens/bottom_nav_holder.dart';
import 'package:ostadecommerce/features/shared/presentation/widgets/centered_circuler_progress.dart';
import 'package:ostadecommerce/features/shared/presentation/widgets/snack_bar_message.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  final LogInController _logInController = Get.find<LogInController>();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 48,),
              AppLogo(width: 100,),
              Text(context.localization.welcomeBack,style: textTheme.titleLarge,),
              Text(context.localization.loginHeadline,style: textTheme.bodyLarge?.copyWith(color: Colors.grey),),
              const SizedBox(height: 24,),
              TextFormField(
                controller: _emailTEController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: "Email",
                ),
              ),
              const SizedBox(height: 8,),
              TextFormField(
                controller: _passwordTEController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  hintText: 'Password'
                ),
              ),
              const SizedBox(height: 16,),
              GetBuilder<LogInController>(
                builder: (controller) {
                  return Visibility(
                      visible: controller.loginInProgress == false,
                      replacement: CenteredCirculerProgress(),
                      child: FilledButton(onPressed: _onTapLoginButton, child: Text("Next")));
                }
              ),
              const SizedBox(height: 16,),
              TextButton(onPressed: _onTapSignUpButton, child: Text("Sign up")),
            ],
          ),
        ),
      )),
    );
  }

  void _onTapLoginButton(){
    //TODO: Validate
    _signIn();
  }

  Future<void> _signIn()async{
    LoginRequestModel model = LoginRequestModel(email: _emailTEController.text.trim(), password: _passwordTEController.text);
    bool isSuccess = await _logInController.logIn(model);
    if(isSuccess){
      // Cache user data
      //Navigate to home

      await Get.find<AuthController>().saveUserData(_logInController.userModel!, _logInController.accessToken!);
      Navigator.pushNamedAndRemoveUntil(context, BottomNavHolder.name, (predicate)=>false);
      print("I am Here");
    }else{
      showSnackBarMessage(context, _logInController.errorMessage!);
    }
  }

  void _onTapSignUpButton(){
    Navigator.pushNamed(context, SignUpScreen.name);
  }


  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
