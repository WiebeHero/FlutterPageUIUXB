import 'package:flutter/cupertino.dart';
import 'package:project/StateManager/state_manager.dart';
import 'package:provider/provider.dart';

class StateManagerWidget extends StatefulWidget{

  const StateManagerWidget({super.key});

  @override
  createState() => _StateManagerWidget();
}

class _StateManagerWidget extends State<StateManagerWidget>{

  @override
  Widget build(BuildContext context) {
    StateManager stateManager = Provider.of<StateManager>(context, listen: false);
    Widget currentWidget = Container();
    stateManager.widgets.forEach((key, value) {
      if(key.compareTo(Provider.of<StateManager>(context).getCurrentState) == 0){
        currentWidget = value;
      }
    });
    return currentWidget;
  }

}