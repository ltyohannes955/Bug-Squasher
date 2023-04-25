import 'package:digital_business_card/views/widget/gNav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'constant/colors.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: LocaleText('language'),
        backgroundColor: '#2B5B80'.toColor(),
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () {Locales.change(context, 'en');Navigator.popAndPushNamed(context, '/contacts');},
            title: Text('English'),
          ),
          ListTile(
              title: const Text('Español'),
              onTap: (){Locales.change(context, 'es');Navigator.popAndPushNamed(context, '/contacts');}),
         
          ListTile(
              title: Text('عربي'), onTap: () {Locales.change(context, 'ar');Navigator.popAndPushNamed(context, '/contacts');},)
,          ListTile(
              title: Text('አማርኛ'),
              onTap: () {
                Locales.change(context, 'am');
                Navigator.popAndPushNamed(context, '/contacts');
              }),
          LocaleText('current'),
          Text(Locales.currentLocale(context)!.languageCode),
          
        ],
      ),
      bottomNavigationBar: gnav(),
    );
  }
}
