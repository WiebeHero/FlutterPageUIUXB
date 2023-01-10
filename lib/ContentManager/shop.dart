import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project/GamePage/accessibility_drawer.dart';
import 'package:project/MainPage/rotated_string.dart';
import 'package:provider/provider.dart';

import 'content_manager.dart';
import '../StateManager/state_manager.dart';

class Shop extends StatefulWidget{

  const Shop({super.key});

  @override
  State<StatefulWidget> createState() => _Shop();

}

class _Shop extends State<Shop>{

  double offsetX = 0;
  double offsetY = 0;
  double angle = 3;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -100),
      child: SizedBox(
        width: 500,
        height: 500,
        child: Container(
          color: Colors.black,
          alignment: Alignment.topCenter,
          child: Stack(
            children: [
              for(int i = 0; i < 4; i++) AnimatedContainer(
                duration: const Duration(seconds: 1),
                child: Transform.rotate(
                  angle: angle * i / 180 * pi,
                  origin: const Offset(-50, 75),
                  child: Transform.translate(
                    offset: Offset(0, 0),
                    child: SizedBox(
                      width: 100,
                      height: 150,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black, width: 2, style: BorderStyle.solid),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Transform.translate(
                offset: const Offset(0, 200),
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      print("Testing");
                      angle = 0;
                    });
                  },
                  child: SizedBox(
                    width: 200,
                    height: 300,
                    child: Container(
                      color: Colors.blue,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}