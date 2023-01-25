import 'package:flutter/material.dart';
import 'package:project/ContentManager/content_manager.dart';
import 'package:project/GamePage/accessibility_drawer.dart';
import 'package:project/GamePage/inventory_button.dart';
import 'package:project/GamePage/queue_button.dart';
import 'package:project/GamePage/shop_button.dart';
import 'package:project/MainPage/rotated_string.dart';
import 'package:provider/provider.dart';

import '../StateManager/state_manager.dart';

class GamePage extends StatelessWidget{

  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ContentManager(),
      child: Builder(
        builder: (BuildContext context) {
          ContentManager contentManager = Provider.of<ContentManager>(context, listen: false);
          Widget currentWidget = Container();
          contentManager.widgets.forEach((key, value) {
            if(key.compareTo(Provider.of<ContentManager>(context).getCurrentContent) == 0){
              currentWidget = value;
            }
          });
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xff6ec1c01),
              title: const RotatedString(stringToRotate: "Cardbreaker: The impact.", fontSize: 36, alignment: MainAxisAlignment.center,),
              centerTitle: true,
            ),
            body: Container(
              color: const Color(0xffBA3002),
              alignment: Alignment.bottomCenter,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 7.5),
                      child: currentWidget
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 75,
                    color: const Color(0xffBA3002),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Provider.of<ContentManager>(context, listen: false).setCurrentContent = "CardArchive";
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 4,
                              padding: const EdgeInsets.only(top: 7),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(color: const Color(0xff6ec1c01), width: 5),
                              ),
                              child: const RotatedString(stringToRotate: "Card Archive", fontSize: 40, alignment: MainAxisAlignment.center,),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Provider.of<ContentManager>(context, listen: false).setCurrentContent = "Inventory";
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 4,
                              padding: const EdgeInsets.only(top: 7),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(color: const Color(0xff6ec1c01), width: 5),
                              ),
                              child: const RotatedString(stringToRotate: "Inventory", fontSize: 40, alignment: MainAxisAlignment.center,),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Provider.of<ContentManager>(context, listen: false).setCurrentContent = "Queue";
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 4,
                              padding: const EdgeInsets.only(top: 7),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(color: const Color(0xff6ec1c01), width: 5),
                              ),
                              child: const RotatedString(stringToRotate: "Queue", fontSize: 40, alignment: MainAxisAlignment.center,),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Provider.of<ContentManager>(context, listen: false).setCurrentContent = "Shop";
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 4,
                              padding: const EdgeInsets.only(top: 7),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(color: const Color(0xff6ec1c01), width: 5),
                              ),
                              child: const RotatedString(stringToRotate: "Shop", fontSize: 40, alignment: MainAxisAlignment.center,),
                            ),
                          ),
                        ],
                      ),
                    )
                  )
                  /*Container(
                    alignment: Alignment.bottomLeft,
                    child: Transform.translate(
                      offset: const Offset(0, -120),
                      child: const InventoryButton(),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Transform.translate(
                      offset: const Offset(-25, -10),
                      child: const ShopButton(),
                    ),
                  ),*/
                ],

              ),
          ),
        );
      }),
    );
  }
}