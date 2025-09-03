import 'package:flutter/material.dart';
import 'package:ostadecommerce/app/app.dart';
import 'package:ostadecommerce/app/extentions/localization_extension.dart';
import 'package:ostadecommerce/features/shared/presentation/widgets/language_change_switch.dart';
import 'package:ostadecommerce/l10n/app_localizations.dart';

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
            Center(
              // child: Text(AppLocalizations.of(context)!.hello),
              child: Text(context.localization.hello),
            ),
            // LanguageChangeSwitch(),
          ],
        ),
      ),
    );
  }
}
