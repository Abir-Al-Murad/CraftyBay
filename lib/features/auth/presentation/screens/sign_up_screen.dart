import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadecommerce/app/extentions/localization_extension.dart';
import 'package:ostadecommerce/features/auth/data/models/sign_up_request_model.dart';
import 'package:ostadecommerce/features/auth/presentation/controllers/sign_up_controller.dart';
import 'package:ostadecommerce/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:ostadecommerce/features/auth/presentation/screens/verify_otp_screen.dart';
import 'package:ostadecommerce/features/home/presentation/widgets/app_logo.dart';
import 'package:ostadecommerce/features/shared/presentation/widgets/centered_circuler_progress.dart';
import 'package:ostadecommerce/features/shared/presentation/widgets/snack_bar_message.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _addressTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  final SignUpController _signUpController = Get.find<SignUpController>();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 24),
                AppLogo(width: 80),
                Text(
                  context.localization.createNewAccount,
                  style: textTheme.titleLarge,
                ),
                Text(
                  context.localization.signUpHeadline,
                  style: textTheme.bodyLarge?.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _emailTEController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: "Email"),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _firstNameTEController,
                  textInputAction: TextInputAction.next,

                  decoration: InputDecoration(hintText: 'First name'),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _lastNameTEController,
                  textInputAction: TextInputAction.next,

                  decoration: InputDecoration(hintText: 'Last name'),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _mobileTEController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(hintText: 'Mobile'),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _addressTEController,
                  textInputAction: TextInputAction.next,

                  decoration: InputDecoration(hintText: 'Address'),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _passwordTEController,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(hintText: 'Password'),
                ),
                const SizedBox(height: 16),
                GetBuilder<SignUpController>(
                  builder: (contoller) {
                    return Visibility(
                      visible: contoller.signUpInProgress == false,
                      replacement: CenteredCirculerProgress(),
                      child: FilledButton(
                        onPressed: _onTapSignUpButton,
                        child: Text("Sign Up"),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: _onTapBackToLoginButton,
                  child: Text("Back to login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignUpButton() {
    _signUp();
  }

  void _onTapBackToLoginButton() {
    Navigator.pushNamed(context, SignInScreen.name);
  }

  Future<void> _signUp() async {
    SignUpRequestModel model = SignUpRequestModel(
      firstName: _firstNameTEController.text.trim(),
      lastName: _lastNameTEController.text.trim(),
      email: _emailTEController.text.trim(),
      password: _passwordTEController.text,
      city: _addressTEController.text.trim(),
      phone: _mobileTEController.text.trim(),
    );

    final bool isSuccess = await _signUpController.signUp(model);
    if(isSuccess){
      showSnackBarMessage(context, "Sign up successful please login");
      Navigator.pushNamed(context, VerifyOtpScreen.name,arguments: _emailTEController.text.trim());

    }else{
      showSnackBarMessage(context, _signUpController.errorMessage!);
    }
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _addressTEController.dispose();

    super.dispose();
  }
}
