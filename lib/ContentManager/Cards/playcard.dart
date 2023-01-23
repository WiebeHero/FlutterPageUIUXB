import 'package:flutter/material.dart';

import 'custom_card.dart';

class PlayCard extends StatefulWidget{

  final CustomCard? card;
  final bool enableText, ignoreAmountRule;
  const PlayCard({super.key, this.card, required this.enableText, required this.ignoreAmountRule});

  @override
  State<StatefulWidget> createState() => _PlayCard();

}

class _PlayCard extends State<PlayCard> with TickerProviderStateMixin{

  late AnimationController controller;

  @override
  void initState(){
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 100), vsync: this);
  }

  @override
  void dispose(){
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.card != null ? SystemMouseCursors.help : SystemMouseCursors.basic,
      onHover: (hovering){
        controller.forward();
      },
      onExit: (hovering){
        controller.reverse();
      },
      child: ScaleTransition(
        scale: Tween<double>(begin: 1.0, end: widget.card != null ? 1.035 : 1.0).animate(controller),
        child: Container(
          width: 100,
          height: 150,
          margin: const EdgeInsets.all(3),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xff3981A8),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black, width: 2, style: BorderStyle.solid),
            gradient: RadialGradient(
              colors: [
                widget.card == null ? const Color(0xff3981A8) : widget.card!.getRarity().color,
                widget.card == null ? const Color(0xff3981A8) : widget.card!.getRarity().color.withOpacity(0.5),
                widget.card == null ? const Color(0xff3981A8) : widget.card!.getRarity().color.withOpacity(0.3),
                const Color(0xff3981A8)
              ],
              stops: const[
                0.3,
                0.8,
                0.9,
                1.0
              ],
            )
          ),
          child: Stack(
            children: [
              if(widget.card != null) SizedBox(
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
                      widget.card!.getHealth().toString(),
                      style: const TextStyle(
                        fontSize: 26,
                        fontFamily: 'Heavyweight',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 90,
                height: 135,
                child: widget.card == null ? Container() : Opacity(
                  opacity: 0.6,
                  child: Image.asset(
                    widget.card != null && widget.card?.getAmount() != (widget.ignoreAmountRule ? 1 : 0) ? widget.card!.getAsset() : "",
                  ),
                ),
              ),
              if(widget.card != null) SizedBox(
                width: 87,
                height: 28,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.card!.getDamage().toString(),
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
              if(widget.card != null) SizedBox(
                width: 85,
                height: 140,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.enableText ? "x${widget.card!.getAmount()}" : "",
                      style: const TextStyle(
                        fontSize: 26,
                        fontFamily: 'Heavyweight',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}