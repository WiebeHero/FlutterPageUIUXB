import 'package:flutter/material.dart';
import 'package:project/MainPage/rotated_string.dart';
import 'package:provider/provider.dart';

import '../StateManager/state_manager.dart';

class AccessibilityDrawer extends StatelessWidget{

  const AccessibilityDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xff6ec1c01),
      child: ListView(
        children: const[
          DrawerHeader(
              child: RotatedString(stringToRotate: "Accessibility", fontSize: 40, alignment: MainAxisAlignment.center,)
          ),
          ListTile(
            leading: Icon(
              Icons.person,
            ),
            title: MouseRegion(cursor: SystemMouseCursors.click, child: RotatedString(stringToRotate: "Account", fontSize: 20, alignment: MainAxisAlignment.start,)),
          ),
          ListTile(
            leading: Icon(
              Icons.dashboard,
            ),
            title: MouseRegion(cursor: SystemMouseCursors.click, child: RotatedString(stringToRotate: "Card Archive", fontSize: 20, alignment: MainAxisAlignment.start,)),
          ),
          ListTile(
            leading: Icon(
              Icons.quiz,
            ),
            title: MouseRegion(cursor: SystemMouseCursors.click, child: RotatedString(stringToRotate: "FAQ", fontSize: 20, alignment: MainAxisAlignment.start,)),
          ),
          /*ListTile(
            leading: Icon(
              Icons.person,
            ),
            title: RotatedString(stringToRotate: "Tutorial", fontSize: 20, alignment: MainAxisAlignment.start,),
          ),*/
        ]
      ),
    );
  }
}