import 'package:digital_business_card/views/constant/colors.dart';
import 'package:flutter/material.dart';

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
                    Navigator.pushNamed(context, "/settings");
                  },
                  child: Text("ENG", style: TextStyle(color: Colors.white),),
                )
              ),
              Container(
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/qr_code');
                  },
                  icon: const Icon(
                    Icons.qr_code_scanner,
                    size: 33,
                  ),
                ),
              )
            ],
          

    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
