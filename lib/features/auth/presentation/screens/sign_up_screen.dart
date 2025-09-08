import 'package:flutter/material.dart';
import 'package:ostadecommerce/app/extentions/localization_extension.dart';
import 'package:ostadecommerce/features/auth/presentation/widgets/app_logo.dart';

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
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 24,),
              AppLogo(width: 80,),
              Text(context.localization.createNewAccount,style: textTheme.titleLarge,),
              Text(context.localization.signUpHeadline,style: textTheme.bodyLarge?.copyWith(color: Colors.grey),),
              const SizedBox(height: 12,),
              TextFormField(
                controller: _emailTEController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: "Email",
                ),
              ),
              const SizedBox(height: 8,),
              TextFormField(
                controller: _firstNameTEController,
                textInputAction: TextInputAction.next,

                decoration: InputDecoration(
                  hintText: 'First name'
                ),
              ),const SizedBox(height: 8,),
              TextFormField(
                controller: _lastNameTEController,
                textInputAction: TextInputAction.next,

                decoration: InputDecoration(
                  hintText: 'Last name'
                ),
              ),const SizedBox(height: 8,),
              TextFormField(
                controller: _mobileTEController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Mobile'
                ),
              ),const SizedBox(height: 8,),
              TextFormField(
                controller: _addressTEController,
                textInputAction: TextInputAction.next,

                decoration: InputDecoration(
                  hintText: 'Address'
                ),
              ),const SizedBox(height: 8,),
              TextFormField(
                controller: _passwordTEController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  hintText: 'Password'
                ),
              ),
              const SizedBox(height: 16,),
              FilledButton(onPressed: _onTapSignUpButton, child: Text("Sign Up")),
              const SizedBox(height: 16,),
              TextButton(onPressed: _onTapBackToLoginButton, child: Text("Back to login")),
            ],
          ),
        ),
      )),
    );
  }

  void _onTapSignUpButton(){}
  void _onTapBackToLoginButton(){
    Navigator.pop(context);
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
