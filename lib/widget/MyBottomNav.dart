import 'package:digital_business_card/utils/rive_utils.dart';
import 'package:digital_business_card/views/category.dart';
import 'package:digital_business_card/views/constant/colors.dart';
import 'package:digital_business_card/views/contacts.dart';
import 'package:digital_business_card/views/setup.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:digital_business_card/utils/AnimatedBar.dart';
import 'package:digital_business_card/utils/RiveAsset.dart';

class MyBottomNav extends StatefulWidget {
  const MyBottomNav({super.key});

  @override
  State<MyBottomNav> createState() => _MyBottomNavState();
}

class _MyBottomNavState extends State<MyBottomNav> {
  RiveAsset selectedBottomNav = bottomNavs.first;
  int page = 0;
  @override
  Widget build(BuildContext context) {
    Widget child = const Contacts();

    switch (page) {
      case 0:
        child = const Contacts();
        break;
      case 1:
        child = const Category();
        break;
      case 2:
        child = const setup();
        break;
    }
    return Scaffold(
        backgroundColor: "#2B5B80".toColor(),
        body: Container(
          child: child,
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Color.fromARGB(43, 255, 255, 255),
            borderRadius: const BorderRadius.all(Radius.circular(24)),
          ),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                    bottomNavs.length,
                    (index) => GestureDetector(
                          onTap: () {
                            bottomNavs[index].input!.change(true);
                            if (bottomNavs[index] != selectedBottomNav) {
                              setState(() {
                                page = index;
                                selectedBottomNav = bottomNavs[index];
                              });
                            }
                            Future.delayed(const Duration(seconds: 1), () {
                              bottomNavs[index].input!.change(false);
                            });
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AnimatedBar(
                                  isActive:
                                      selectedBottomNav == bottomNavs[index]),
                              SizedBox(
                                height: 36,
                                width: 36,
                                child: Opacity(
                                  opacity:
                                      bottomNavs[index] == selectedBottomNav
                                          ? 1
                                          : 0.5,
                                  child: RiveAnimation.asset(
                                    bottomNavs.first.src,
                                    artboard: bottomNavs[index].artboard,
                                    onInit: (artboard) {
                                      StateMachineController controller =
                                          RiveUtils.getRiveController(artboard,
                                              stateMachineName:
                                                  bottomNavs[index]
                                                      .stateMachineName);
                                      bottomNavs[index].input = controller
                                          .findSMI("active") as SMIBool;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ))
              ],
            ),
          ),
        ));
  }
}
