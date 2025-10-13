import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadecommerce/features/auth/data/models/verify_otp_request_model.dart';
import 'package:ostadecommerce/features/auth/presentation/controllers/verify_otp_controller.dart';
import 'package:ostadecommerce/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:ostadecommerce/features/home/presentation/widgets/app_logo.dart';
import 'package:ostadecommerce/features/shared/presentation/widgets/centered_circuler_progress.dart';
import 'package:ostadecommerce/features/shared/presentation/widgets/snack_bar_message.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key,required this.email});

  static const String name = '/verify-otp';
  final String email;

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final VerifyOtpController _verifyOtpController = Get.find<VerifyOtpController>();
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
                const SizedBox(height: 48),
                AppLogo(width: 100),
                Text("Verify OTP", style: textTheme.titleLarge),
                Text(
                  "A 6 digit OTP has been sent to your email address",
                  style: textTheme.bodyLarge?.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 24),
                PinCodeTextField(
                  appContext: context,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  animationDuration: Duration(milliseconds: 300),
                  controller: _otpTEController,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                  ),
                ),
                const SizedBox(height: 16),
                GetBuilder<VerifyOtpController>(
                  builder: (controller) {
                    return Visibility(
                      visible: controller.verifyOtpInProgress == false,
                      replacement:  CenteredCirculerProgress(),
                      child: FilledButton(
                        onPressed: _onTapVerifyButton,
                        child: Text("Verify"),
                      ),
                    );
                  }
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: _onTapBackToLoginButton,
                  child: Text("Back to Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapVerifyButton() {
    //TODO : Validate form
    _verifyOtp();
  }

  Future<void> _verifyOtp()async{

    VerifyOtpRequestModel model = VerifyOtpRequestModel(email: widget.email, otp: _otpTEController.text);

    final bool isSuccess = await _verifyOtpController.verifyOtp(model);
    if(isSuccess){
      // Cache user data
      //Navigate to home
    }else{
      showSnackBarMessage(context, _verifyOtpController.errorMessage!);
    }
  }
  void _onTapBackToLoginButton() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      SignInScreen.name,
      (predicate) => false,
    );
  }

  @override
  void dispose() {
    _otpTEController.dispose();

    super.dispose();
  }
}
