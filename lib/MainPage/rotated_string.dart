import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

import 'package:flutter/material.dart';

class RotatedString extends StatelessWidget{

  final String stringToRotate;

  const RotatedString({super.key, required this.stringToRotate});

  @override
  Widget build(BuildContext context) {

    List<Widget> strings = <Widget>[];
    Characters splitString = stringToRotate.characters;
    int temp = 0;
    for (var char in splitString) {
      strings.add(
        Transform.rotate(
          angle: temp % 2 == 0 ? math.pi / 32 : -math.pi / 32,
          child: Text(
            style: const TextStyle(

            ),
            char
          ),
        ),
      );
      temp++;
    }

    return Container(
      color: Colors.green,
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for(var i in strings) i,
        ],
      ),
    );
  }

}