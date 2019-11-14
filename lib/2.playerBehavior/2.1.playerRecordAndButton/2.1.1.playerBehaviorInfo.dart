import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:werewolf_quantjudge/models/behavior.dart';

class PlayerBehaviorInfo extends StatelessWidget {

  final Behavior behavior;

  /*
   * Constructor
   */
  PlayerBehaviorInfo(this.behavior);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            behavior.player.toString() + "号玩家",
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.black54),
          ),
          width: 55,
        ),
        // 具体的行为标签描述。
        Container(
          child: Card(child: Text(behavior.title)),
          width: 110,
        ),
        // 对于所选行为标签的狼面值。
        Container(
          child: Card(child: Text(behavior.quantity.toString())),
          width:45,
        ),
        Container(
          child: Card(child: Text(DateFormat('Hms').format(behavior.date))),
          width:85,
        ),
        //Container(child: Card(child: Text(date.toString()))),
      ],
    );
  }
}
