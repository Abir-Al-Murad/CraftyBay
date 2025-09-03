import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ostadecommerce/app/assests_paths.dart';
import 'package:ostadecommerce/app/extentions/localization_extension.dart';
import 'package:ostadecommerce/app/utils/app_version_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Center(
            //   // child: Text(AppLocalizations.of(context)!.hello),
            //   child: Text(context.localization.hello),
            // ),
            // LanguageChangeSwitch(),
            Spacer(flex: 2,),
            SvgPicture.asset('assets/images/logo.svg',width: 120,),
            Spacer(flex: 1,),
            CircularProgressIndicator(),
            SizedBox(height: 25,),
            Text("${context.localization.version} ${AppVersionService.currentAppVersion}"),
            Spacer(flex: 1,),
          ]
        ),
      ),
    );
  }
}
