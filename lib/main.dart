import 'package:flutter/material.dart';
import 'package:project/StateManager/state_manager_widget.dart';
import 'package:provider/provider.dart';

import 'StateManager/state_manager.dart';

void main() {
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