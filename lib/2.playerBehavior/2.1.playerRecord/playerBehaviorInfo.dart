import 'package:flutter/material.dart';

class PlayerBehaviorInfo extends StatelessWidget {
  final int player;
  final String title;
  final double quantity;
  final DateTime date;

  /*
   * Constructor
   */
  PlayerBehaviorInfo(this.player, this.title, this.quantity, this.date);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          child: Text(
            player.toString() + "号玩家",
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.black54),
          ),
          width: 60,
        ),
        // 2.1.2.1
        Container(
          child: Card(child: Text(title)),
          width: 120,
        ),
        // 2.1.2.2
        Container(
          child: Card(child: Text(quantity.toString())),
          width:50,
        ),
        // 2.1.2.3
        //Container(child: Card(child: Text(date.toString()))),
      ],
    );
  }
}
