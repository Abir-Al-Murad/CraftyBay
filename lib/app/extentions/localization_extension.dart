import 'package:flutter/cupertino.dart';
import 'package:ostadecommerce/l10n/app_localizations.dart';

extension LocalizationExtension on BuildContext{
  AppLocalizations get localization {
    return AppLocalizations.of(this)!;
  }
}