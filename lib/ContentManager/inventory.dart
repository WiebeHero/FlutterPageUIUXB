import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project/ContentManager/Cards/inventory_manager.dart';
import 'package:project/GamePage/accessibility_drawer.dart';
import 'package:project/MainPage/rotated_string.dart';

import 'Cards/custom_card.dart';
import 'Cards/playcard.dart';
import 'content_manager.dart';
import '../StateManager/state_manager.dart';

class Inventory extends StatefulWidget{

  const Inventory({super.key});

  @override
  State<StatefulWidget> createState() => _Inventory();

}

class _Inventory extends State<Inventory> with TickerProviderStateMixin{

  @override
  void initState(){
    super.initState();
    //9 Cards in 1 row
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, 0),
      child: SizedBox(
        width: 1000,
        height: 680,
        child: Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.black,
          ),
          child: Column(
            children: [
              //was 4
              for(int i = 0; i < 4; i++) Row(
                children: [
                  //was 9
                  for(int x = 0; x < 9; x++) x * i < InventoryManager.cardsOwned.length ? PlayCard(card: InventoryManager.cardsOwned[x * i]) : const PlayCard()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}