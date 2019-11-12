import 'package:flutter/material.dart';
import 'package:werewolf_quantjudge/2.playerBehavior/behavior.dart';
import 'package:werewolf_quantjudge/2.playerBehavior/playerBehaviorRecordCard.dart';

class TurnInfo extends StatelessWidget {
  final int turn; // to be changed into turnselector object.
  final List<Behavior> turnBehaviors = [
    Behavior(
      turn: 1,
      id: 1,
      player: 1,
      title: "坐姿表情3",
      quantity: 50,
      date: DateTime.now(),
    ),
    Behavior(
      turn: 1,
      id: 3,
      player: 2,
      title: "站边举票3",
      quantity: 50,
      date: DateTime.now(),
    ),
  ];

  /*
   * Constructor
   */
  TurnInfo(
    this.turn,
    //this.turnBehaviors,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        // turnInfo's decoration.
        width: 300,
        margin: EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 5,
        ),
        child: Column(children: <Widget>[
          // 轮数
          Container(
            child: Card(
              child: Text(
                "第" + turn.toString() + "轮",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),

          // 每一轮的用户行为
          Container(
            child: Column(
              children: turnBehaviors.map((bh) {
                return Container(child: PlayerBehaviorRecordCard());
              }).toList(),
            ),
          )
        ]),
      ),
    );
  }
}
