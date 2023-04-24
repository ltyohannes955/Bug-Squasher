import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'constant/colors.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  LocaleText('language'),backgroundColor:  '#2B5B80'.toColor() ,),
    
      body: Column(
        children: [
          ListTile(
            onTap: () => Locales.change(context, 'en'),
            title: LocaleText('english'),
          ),
          ListTile(
            title: const LocaleText('spanish'),
            onTap: () => Locales.change(context, 'es')
           
            
          ),
          // to change language with Extension
          ListTile(
            title: const LocaleText('arabic'),
            onTap: () => Locales.change(context, 'ar')
          ),
            ListTile(
            title: const LocaleText('amharic'),
            onTap: () => Locales.change(context, 'am')
          ),
          LocaleText('current_language_is: ' +
              Locales.currentLocale(context)!.languageCode),
          // Text('Current Locale: ' + context.currentLocale.languageCode), // with Extension
        ],
      ),
    );
  }
}