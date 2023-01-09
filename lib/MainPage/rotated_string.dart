import 'dart:math' as math;

import 'package:flutter/material.dart';

class RotatedString extends StatelessWidget{

  final String stringToRotate;
  final double fontSize;
  final MainAxisAlignment alignment;
  final Color? color;

  const RotatedString({super.key, required this.stringToRotate, required this.fontSize, required this.alignment, this.color});

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
            style: TextStyle(
              color: color ?? Colors.black,
              fontFamily: 'Heavyweight',
              fontSize: fontSize,
            ),
            char
          ),
        ),
      );
      temp++;
    }

    return  Row(
        mainAxisAlignment: alignment,
        children: [
          for(var i in strings) i,
        ],
    );
  }

}