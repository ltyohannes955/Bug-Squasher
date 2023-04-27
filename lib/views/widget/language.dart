import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_locales/flutter_locales.dart';

class language extends StatefulWidget {
  const language({super.key});

  @override
  State<language> createState() => _languageState();
}

class _languageState extends State<language> {
  String _currentPage = "Page 1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color.fromARGB(96, 13, 74, 155),
        body: Container(
      height: MediaQuery.of(context).size.height * 0.5,
      
      child: Wrap(
        children: [
          ListTile(
            title: Text('English'),
            onTap: () {
              Locales.change(context, 'en');
              
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('አማርኛ'),
            onTap: () {
              Locales.change(context, 'am');
              
                _currentPage = "Page 2";
              
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('عربي'),
            onTap: () {
              
                Locales.change(context, 'ar');
              
            
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Español'),
            onTap: () {
              Locales.change(context, 'es');
              
              Navigator.pop(context);
            },
          ),
        ],
      ),
    ));
  }
}
