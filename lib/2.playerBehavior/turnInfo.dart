import 'package:flutter/material.dart';
import 'package:werewolf_quantjudge/2.playerBehavior/behavior.dart';
import 'package:werewolf_quantjudge/2.playerBehavior/mappedBehavior.dart';
import 'package:werewolf_quantjudge/2.playerBehavior/playerBehaviorRecordCard.dart';

class TurnInfo extends StatelessWidget {
  /*
   * Properties.
   */
  final MappedBehavior mappedBehavior;

  final List<Behavior> turnBehaviors2 = [
    Behavior(
      turn: 1,
      id: 1,
      player: 1,
      title: "坐姿表情356",
      quantity: 50,
      date: DateTime.now(),
    ),
    Behavior(
      turn: 1,
      id: 3,
      player: 2,
      title: "站边举票332",
      quantity: 50,
      date: DateTime.now(),
    ),
  ];

  /*
   * Constructor
   */
  TurnInfo(this.mappedBehavior);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        // turnInfo's decoration.
        width: 300,
        margin: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
        child: Column(children: <Widget>[
          // 轮数
          Container(
            child: Card(
              child: Text(
                "第" + mappedBehavior.turn.toString() + "轮",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
          ),

          // 每一轮的用户行为
          Container(
            child: Column(
              children: mappedBehavior.turnBehaviors.map((tbh) {
                return Container(child: PlayerBehaviorRecordCard(tbh));
              }).toList(),
            ),
          )
        ]),
      ),
    );
  }
}
