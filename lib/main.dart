import 'package:flutter/material.dart';
import 'package:project/ContentManager/Cards/custom_card.dart';
import 'package:project/StateManager/state_manager_widget.dart';
import 'package:provider/provider.dart';

import 'ContentManager/Cards/inventory_manager.dart';
import 'StateManager/state_manager.dart';



void main() {
  InventoryManager.cardsOwned.add(CustomCard(3, 0, 4, Rarity.legendary, "images/MushroomRed.png"));
  InventoryManager.cardsOwned.add(CustomCard(1, 2, 2, Rarity.rare, "images/MushroomBlue.png"));
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