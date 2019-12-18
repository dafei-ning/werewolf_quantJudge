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
        // Player
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            behavior.player.toString() + "号玩家",
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.black26),
          ),
          width: 55,
        ),
        // test turn
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            behavior.turn.toString() + "号玩家",
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.black26),
          ),
          width: 5,
        ),
        // DescribeTag
        Container(
          margin: EdgeInsets.only(left: 2),
          child: Text(
            behavior.describeTab,
            style: Theme.of(context).textTheme.title,
          ),
          width: 140,
        ),
        // Score
        Container(
          margin: EdgeInsets.only(left: 5),
          child: Text(behavior.quantity.toString()),
          width: 48,
        ),
        // Time
        Container(
          margin: EdgeInsets.only(left: 2),
          child: Text(
            DateFormat('Hms').format(behavior.date),
            style: TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.bold,
            ),
          ),
          width: 68,
        ),
      ],
    );
  }
}
