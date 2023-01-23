import 'package:flutter/material.dart';
import 'package:project/GamePage/accessibility_drawer.dart';
import 'package:project/MainPage/rotated_string.dart';
import 'package:provider/provider.dart';

import '../ContentManager/content_manager.dart';
import '../StateManager/state_manager.dart';

class ShopButton extends StatelessWidget{

  const ShopButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Provider.of<ContentManager>(context, listen: false).setCurrentContent = "Shop";
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: SizedBox(
          width: 100,
          height: 100,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xff14648F),
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
                style: BorderStyle.solid,
              ),
            ),
            child: const RotatedString(stringToRotate: "Shop", fontSize: 28, alignment: MainAxisAlignment.center,),
          ),
        ),
      ),
    );

  }
}