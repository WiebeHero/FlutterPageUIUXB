import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project/GamePage/accessibility_drawer.dart';
import 'package:project/MainPage/rotated_string.dart';
import 'package:provider/provider.dart';

import 'content_manager.dart';
import '../StateManager/state_manager.dart';

class SlideShow extends StatefulWidget{

  const SlideShow({super.key});

  @override
  State<StatefulWidget> createState() => _SlideShow();

}

class _SlideShow extends State<SlideShow>{

  int slide = 0;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, 200),
      child: Column(
        children: [
          Stack(
            children: [
              for(int i = 0; i < 10; i++) Visibility(
                visible: slide == i,
                child: SizedBox(
                  width: 800,
                  height: 500,
                  child: Container(
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                ),
              ),
              Transform.translate(
                offset: const Offset(-25, 200),
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      slide--;
                      if(slide < 0){
                        slide = 9;
                      }
                    });
                  },
                  child: const Icon(
                    Icons.chevron_left,
                    size: 100,
                  ),
                ),
              ),
              Transform.translate(
                offset: const Offset(725, 200),
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      slide++;
                      if(slide > 9){
                        slide = 0;
                      }
                    });
                  },
                  child: const Icon(
                    Icons.chevron_right,
                    size: 100
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 475,
            height: 35,
            child: Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for(int i = 0; i < 10; i++) Container(
                    width: 25,
                    height: 25,
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: slide == i ? Colors.red : Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}