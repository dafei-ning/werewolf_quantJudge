import 'package:flutter/material.dart';
import 'package:werewolf_quantjudge/2.playerBehavior/behavior.dart';
import 'package:werewolf_quantjudge/2.playerBehavior/playerBehaviorRecordCard.dart';

class TurnInfo extends StatelessWidget {
  final int turn; // to be changed into turnselector object.
  final List<Behavior> mappedBehaviors;

  /*
   * Constructor
   */
  TurnInfo(this.turn, this.mappedBehaviors);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // // 2.1.1.1 behavior id
        // Container(child: Text(id.toString())),
        // 2.1.1.1 轮数
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
            children: behaviors.map((bh) {
              return Container(child: playerBehaviorRecordCard(bh));
            }).toList(),
          ),
        )
      ],
    );
  }
}
