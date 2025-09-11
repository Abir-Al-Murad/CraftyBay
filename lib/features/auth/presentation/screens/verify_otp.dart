import 'package:flutter/material.dart';
import 'package:ostadecommerce/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:ostadecommerce/features/home/presentation/widgets/app_logo.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  static const String name = '/verify-otp';

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _otpTEController = TextEditingController();
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
                  length: 6,
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
                FilledButton(
                  onPressed: _onTapVerifyButton,
                  child: Text("Verify"),
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

  void _onTapVerifyButton() {}
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
