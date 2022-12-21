import 'dart:collection';

import 'package:flutter/cupertino.dart';

import '../MainPage/start_menu.dart';

class StateManager extends ChangeNotifier{

  String _currentState = "StartMenu";

  final HashMap<String, Widget> _widgets = HashMap<String, Widget>();
  UnmodifiableMapView<String, Widget> get widgets => UnmodifiableMapView(_widgets);

  StateManager(){
    _widgets.addAll({"StartMenu": const StartMenu()});
  }

  set setCurrentState(String newState) {
    _currentState = newState;
    notifyListeners();
  }

  String get getCurrentState => _currentState;


}