import 'package:flutter/material.dart';

import 'custom_card.dart';

class PlayCard extends StatefulWidget{

  final CustomCard? card;
  const PlayCard({super.key, this.card});

  @override
  State<StatefulWidget> createState() => _PlayCard();

}

class _PlayCard extends State<PlayCard>{

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 150,
      margin: const EdgeInsets.all(3),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black, width: 2, style: BorderStyle.solid),
      ),
      child: Stack(
        children: [
          SizedBox(
            width: 90,
            height: 135,
            child: widget.card == null ? Container() : Image.asset(
              widget.card != null && widget.card?.getAmount() != 0 ? widget.card!.getAsset() : "",
            ),
          ),
        ],
      ),
    );
  }
}