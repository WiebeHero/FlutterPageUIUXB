import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project/ContentManager/Cards/inventory_manager.dart';
import 'package:project/GamePage/accessibility_drawer.dart';
import 'package:provider/provider.dart';

import 'Cards/custom_card.dart';
import 'Cards/playcard.dart';
import 'content_manager.dart';
import '../StateManager/state_manager.dart';

class Inventory extends StatefulWidget{

  const Inventory({super.key});

  @override
  State<StatefulWidget> createState() => _Inventory();

}

class _Inventory extends State<Inventory>{

  @override
  void initState(){
    super.initState();
    //9 Cards in 1 row
  }

  @override
  void dispose(){
    super.dispose();
  }

  List<PlayCard> calculate(int i){
    int offset = 0;
    List<PlayCard> cards = <PlayCard>[];
    for(int x = 0; x < 9 + offset; x++) {
      String xandi = "$i$x";
      int transfer = int.parse(xandi);
      if(transfer < InventoryManager.cardsOwned.length){
        if(InventoryManager.cardsOwned[transfer].getAmount() > 0){
          cards.add(PlayCard(card: InventoryManager.cardsOwned[transfer], enableText: true, ignoreAmountRule: false,));
        }
        else{
          offset += 1;
        }
      }
      else{
        cards.add(const PlayCard(enableText: false, ignoreAmountRule: false,));
      }

    }
    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, 0),
      child: SizedBox(
        width: 1000,
        height: 684,
        child: Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color(0xff14648F),
          ),
          child: Column(
            children: [
              SizedBox(
                width: 990,
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        Provider.of<ContentManager>(context, listen: false).setCurrentContent = "SlideShow";
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ],
                )
              ),
              Column(
                children: [
                  //was 4
                  for(int i = 0; i < 4; i++) Row(
                    children: calculate(i),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}