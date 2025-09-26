import 'package:flutter/material.dart';
import 'package:ostadecommerce/app/extentions/localization_extension.dart';
import 'package:ostadecommerce/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:ostadecommerce/features/home/presentation/widgets/app_logo.dart' show AppLogo;

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
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
              FilledButton(onPressed: _onTapLoginButton, child: Text("Next")),
              const SizedBox(height: 16,),
              TextButton(onPressed: _onTapSignUpButton, child: Text("Sign up")),
            ],
          ),
        ),
      )),
    );
  }

  void _onTapLoginButton(){}
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
