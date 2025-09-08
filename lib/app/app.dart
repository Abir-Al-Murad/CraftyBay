import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:ostadecommerce/app/app_colors.dart';
import 'package:ostadecommerce/app/app_theme.dart';
import 'package:ostadecommerce/app/controller/language_controller.dart';
import 'package:ostadecommerce/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:ostadecommerce/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:ostadecommerce/features/auth/presentation/screens/splash_screen.dart';
import 'package:ostadecommerce/l10n/app_localizations.dart';

class CraftyBay extends StatefulWidget {
  const CraftyBay({super.key});

  static final LanguageController languageController = LanguageController();  // jate shobai use korte pare tai ekhane static kore create kore hoyeche


  @override
  State<CraftyBay> createState() => _CraftyBayState();
}

class _CraftyBayState extends State<CraftyBay> {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(
    analytics: analytics,
  );

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CraftyBay.languageController,
      builder: (languageController) {
        return MaterialApp(
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: languageController.supportedLocales,
          theme: AppTheme.lightThemeData,
          darkTheme: AppTheme.darkThemeData,
          themeMode: ThemeMode.light,  //default themeMode,,,app e button diye ekate change kore theme control kora hoy
          locale: languageController.currentLocale, //kontak enable rakhte chan sheta
          navigatorObservers: [observer],
          home: SplashScreen(),
          initialRoute: SplashScreen.name,
          onGenerateRoute: (settings){
            late Widget screen;
            if(settings.name == SplashScreen.name){
              screen = SplashScreen();
            }else if(settings.name == SignInScreen.name){
              screen = SignInScreen();
            }else if(settings.name == SignUpScreen.name){
              screen = SignUpScreen();
            }

            return MaterialPageRoute(builder: (ctx)=>screen);
          },
        );
      }
    );
  }
}
