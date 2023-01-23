import 'package:flutter/material.dart';
import 'package:project/MainPage/rotated_string.dart';
import 'package:provider/provider.dart';

import '../StateManager/state_manager.dart';

class StartMenu extends StatelessWidget{

  const StartMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff9E6A26),
        title: const RotatedString(stringToRotate: "Cardbreaker: The impact.", fontSize: 36, alignment: MainAxisAlignment.center,),
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xff9E6A26),
        alignment: Alignment.center,
        child: SizedBox(
          width: 200 + MediaQuery.of(context).size.width * 0.25,
          height:  200 + MediaQuery.of(context).size.height * 0.25,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xffFFC170),
              border: Border.all(color: Colors.black, width: 1, style: BorderStyle.solid),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: SizedBox(
              width: 100,
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Provider.of<StateManager>(context, listen: false).setCurrentState = "GamePage";
                    },
                    child: const _MainMenuButton(text: "Start"),
                  ),
                  const _MainMenuButton(text: "Settings"),
                  const _MainMenuButton(text: "Quit"),
                ],
              ),
            )
          ),
        ),
      ),
    );
  }
}

class _MainMenuButton extends StatelessWidget {

  final String text;
  const _MainMenuButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: RotatedString(stringToRotate: text, fontSize: 20, alignment: MainAxisAlignment.center),
      ),
    );
  }
}
