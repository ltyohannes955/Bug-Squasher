import 'package:digital_business_card/views/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:rive/rive.dart';

class MyBottomNav extends StatelessWidget {
  const MyBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: "#".toColor(),
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
          child: Row(
            children: [
              SizedBox(
                height: 36,
                width: 36,
                child: RiveAnimation.asset(
                  "assets/RivAssets/icons.riv",
                  artboard: "SEARCH",
                  onInit: (artboard) {
                    StateMachineController controller = RiveUtils
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
