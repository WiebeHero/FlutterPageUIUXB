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
    return Scaffold(
      drawer: const AccessibilityDrawer(),
      appBar: AppBar(
        backgroundColor: const Color(0xff6ec1c01),
      ),
      body: Container(
        color: const Color(0xffBA3002),
        alignment: Alignment.center,
        child: Stack(
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              child: Transform.translate(
                offset: const Offset(0, -10),
                child: const QueueButton(),
              ),
            ),
            ChangeNotifierProvider(
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
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      currentWidget,
                      Container(
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
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}