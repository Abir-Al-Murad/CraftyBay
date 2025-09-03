import 'package:flutter/material.dart';
import 'package:ostadecommerce/app/app.dart';
import 'package:ostadecommerce/app/extentions/localization_extension.dart';

class LanguageChangeSwitch extends StatelessWidget {
  const LanguageChangeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(context.localization.selectLanguage),
      trailing: DropdownMenu<Locale>(
        dropdownMenuEntries: CraftyBay.languageController.supportedLocales.map((
          e,
        ) {
          return DropdownMenuEntry(value: e,
              label: e.languageCode);
        }).toList(),
        onSelected: (Locale? local) {
          CraftyBay.languageController.changeLocale(local!);
        },
      ),
    );
  }
}
