import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class setup extends StatelessWidget {
   setup({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  void signout(){
    FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Center(child: 
          Text('logged in as: '+ user.email! )),
          IconButton(onPressed:
            signout,
           icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}