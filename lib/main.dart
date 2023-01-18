import 'package:flutter/material.dart';
import 'package:project/ContentManager/Cards/custom_card.dart';
import 'package:project/StateManager/state_manager_widget.dart';
import 'package:provider/provider.dart';

import 'ContentManager/Cards/inventory_manager.dart';
import 'StateManager/state_manager.dart';



void main() {
  InventoryManager.cardsOwned.add(CustomCard("MushroomRed", 3, 0, 0, Rarity.common, "images/MushroomRed.png"));
  InventoryManager.cardsOwned.add(CustomCard("MushroomBlue", 1, 2, 0, Rarity.rare, "images/MushroomBlue.png"));
  InventoryManager.cardsOwned.add(CustomCard("MushroomYellow", 2, 2, 0, Rarity.epic, "images/MushroomYellow.png"));
  InventoryManager.cardsOwned.add(CustomCard("MushroomGreen", 4, 1, 0, Rarity.legendary, "images/MushroomGreen.png"));
  InventoryManager.cardsOwned.add(CustomCard("MushroomGreen", 4, 4, 0, Rarity.heroic, "images/MushroomGreen.png"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cardbreaker: The Impact',
      /*theme: ThemeData(
        primarySwatch: Colors.blue,
      ),*/
      home: ChangeNotifierProvider(
        create: (context) => StateManager(),
        child: const StateManagerWidget(),
      ),
    );
  }
}