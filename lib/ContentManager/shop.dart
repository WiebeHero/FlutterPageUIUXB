import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project/ContentManager/Cards/custom_card.dart';
import 'package:project/ContentManager/Cards/inventory_manager.dart';
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

  double angle = 2;
  late AnimationController moveRotatecontroller;
  late AnimationController opacityController;
  List<CustomCard> cards = <CustomCard>[];

  @override
  void initState(){
    print("Initting!");
    super.initState();
    moveRotatecontroller = AnimationController(duration: const Duration(seconds: 1), vsync: this);
    opacityController = AnimationController(duration: const Duration(seconds: 1), vsync: this);
    fillCards();
  }

  void fillCards(){
    cards.clear();
    for(int i = 0; i < 4; i++){
      double rand = Random().nextDouble();
      late Rarity rarity;
      print(rand);
      if(rand >= 0.99) {
        rarity = Rarity.heroic;
      }
      else if(rand >= 0.94) {
        rarity = Rarity.legendary;
      }
      else if(rand >= 0.79) {
        rarity = Rarity.epic;
      }
      else if(rand >= 0.59) {
        rarity = Rarity.rare;
      }
      else {
        rarity = Rarity.common;
      }
      cards.add(InventoryManager.getRandomCard(rarity));
      print("Done!");
    }
    print("Card added!");
  }

  @override
  void dispose(){
    moveRotatecontroller.dispose();
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
                    for(int i = 0; i < 4; i++)
                      RotationTransition(
                      turns: Tween(begin: angle * i / 180 * pi, end: 0.0).animate(moveRotatecontroller),
                      child: SlideTransition(
                        position: Tween<Offset>(begin: Offset.zero, end: Offset(-2.0 + i * 1.33, 1.5)).animate(moveRotatecontroller),
                        child: Container(
                          width: 100,
                          height: 150,
                          margin: const EdgeInsets.all(3),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xff008C6C),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black, width: 2, style: BorderStyle.solid),
                          ),
                          child: FadeTransition(
                            opacity: Tween<double>(begin: 0, end: 1.0).animate(opacityController),
                            child: Stack(
                              children: [
                                Container(
                                  width: 90,
                                  height: 135,
                                  decoration: BoxDecoration(
                                      gradient: RadialGradient(
                                        colors: [
                                          cards[i].getRarity().color,
                                          cards[i].getRarity().color.withOpacity(0.5),
                                          cards[i].getRarity().color.withOpacity(0.3),
                                          const Color(0xff008C6C)
                                        ],
                                        stops: const[
                                          0.3,
                                          0.8,
                                          0.9,
                                          1.0
                                        ],
                                      )
                                  ),
                                  child: Opacity(
                                    opacity: 0.6,
                                    child: Image.asset(
                                      cards[i].getAsset(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                  height: 28,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "images/Heart.png",
                                        width: 25,
                                        height: 25,
                                      ),
                                      Text(
                                        cards[i].getHealth().toString(),
                                        style: const TextStyle(
                                          fontSize: 26,
                                          fontFamily: 'Heavyweight',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 87,
                                  height: 28,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        cards[i].getDamage().toString(),
                                        style: const TextStyle(
                                          fontSize: 26,
                                          fontFamily: 'Heavyweight',
                                        ),
                                      ),
                                      Image.asset(
                                        "images/Sword.png",
                                        width: 25,
                                        height: 25,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      double rand;
                      Rarity rarity;
                      for(int i = 0; i < cards.length; i++){
                        for(int x = 0; x < InventoryManager.cardsOwned.length; x++){
                          if(cards[i].getIdentifier() == InventoryManager.cardsOwned[x].getIdentifier()){
                            InventoryManager.cardsOwned[x].setAmount(InventoryManager.cardsOwned[x].getAmount() + 1);
                            break;
                          }
                        }
                      }
                      moveRotatecontroller.forward().whenComplete(() => {
                        opacityController.forward().whenComplete(() async => {
                          await Future.delayed(const Duration(seconds: 1), (){}),
                          opacityController.reverse(),
                          await Future.delayed(const Duration(seconds: 1), (){}),
                          moveRotatecontroller.reverse().whenComplete(() => {
                            fillCards(),
                          }),
                        }),
                      });
                    });
                  },
                  child: SizedBox(
                    width: 300,
                    height: 150,
                    child: Container(
                      alignment: Alignment.center,
                      color: const Color(0xff00BA8F),
                      child: const RotatedString(stringToRotate: "Pull for cards", fontSize: 26, alignment: MainAxisAlignment.center,),
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