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

class _Shop extends State<Shop> with TickerProviderStateMixin{

  double offsetX = 0;
  double offsetY = 0;
  double angle = 2;
  late AnimationController controller;

  @override
  void initState(){
    super.initState();
    controller = AnimationController(duration: const Duration(seconds: 1), vsync: this);
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, 0),
      child: SizedBox(
        width: 500,
        height: 800,
        child: Container(
          color: Colors.black,
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 100),
                width: 300,
                height: 600,
                alignment: Alignment.topCenter,
                child: Stack(
                  children: [
                    for(int i = 0; i < 4; i++) RotationTransition(
                      turns: Tween(begin: angle * i / 180 * pi, end: 0.0).animate(controller),
                      child: SlideTransition(
                        position: Tween<Offset>(begin: Offset.zero, end: Offset(-2.0 + i * 1.33, 1.5)).animate(controller),
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
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    print("Testing");
                    controller.forward().whenComplete(() => {
                      controller.reverse(),
                    });
                  });
                },
                child: SizedBox(
                  width: 200,
                  height: 100,
                  child: Container(
                    color: Colors.blue,
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