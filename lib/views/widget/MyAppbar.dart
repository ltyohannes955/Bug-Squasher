import 'package:digital_business_card/views/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import 'language.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(

      
            backgroundColor: '#2B5B80'.toColor(),
            title:  Text(
              'DBC',
              style: TextStyle(
                  fontSize: 31.09,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal),
            ),
            
            actions: [
              Container(
                child: TextButton(
                  onPressed: (){
                    showModalBottomSheet(
                  context: context, builder: (BuildContext context) => language());
                  },
                  child: LocaleText("language", style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
                )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/Qrcode');
                    },
                    icon: const Icon(
                      Icons.qr_code_scanner,
                      size: 33,
                    ),
                  ),
                ),
              )
            ],
          

    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
