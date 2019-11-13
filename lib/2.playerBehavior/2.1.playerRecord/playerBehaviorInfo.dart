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
          alignment: Alignment.center,
          child: Text(
            player.toString() + "号玩家",
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.black54),
          ),
          width: 60,
        ),
        // 具体的行为标签描述。
        Container(
          child: Card(child: Text(title)),
          width: 120,
        ),
        // 对于所选行为标签的狼面值。
        Container(
          child: Card(child: Text(quantity.toString())),
          width:50,
        ),
        //Container(child: Card(child: Text(date.toString()))),
      ],
    );
  }
}
