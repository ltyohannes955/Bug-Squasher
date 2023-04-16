import 'package:digital_business_card/views/constant/colors.dart';
import 'package:flutter/material.dart';


class MyAppbar extends StatelessWidget implements PreferredSizeWidget{


  @override
  Widget build(BuildContext context) {
    return AppBar(
            backgroundColor: '#2B5B80'.toColor(),
            title: const Text(
              'DBC',
              style: TextStyle(
                  fontSize: 31.09,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal),
            ),
            centerTitle: true,
            actions: [
              Container(
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                  icon: const Icon(
                    Icons.account_circle_outlined,
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