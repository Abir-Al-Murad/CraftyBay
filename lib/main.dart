import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:ostadecommerce/app/app.dart';
import 'package:ostadecommerce/firebase_options.dart';

//Application er age setup dite hobe-->
//localization
//theme
//1.crashlytics (error,crash..etc report ekhane pabo)
//analytics


void main()async{
  WidgetsFlutterBinding.ensureInitialized();  //-- flutter engine initialze korbe
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  //Pass all uncaught fatal errors from the framework to crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError; // Flutter jeta generate kore
  //Pass all uncaught asynchronous errors that aren't handled by the flutter framework to crashlytics
  PlatformDispatcher.instance.onError = (error,stack){  // ami nije generate koir
    FirebaseCrashlytics.instance.recordError(error, stack,fatal: true);
    return true;
  };
  runApp(const CraftyBay());
}