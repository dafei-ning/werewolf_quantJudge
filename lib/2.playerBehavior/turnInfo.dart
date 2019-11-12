import 'package:flutter/material.dart';
import 'package:werewolf_quantjudge/2.playerBehavior/behavior.dart';
import 'package:werewolf_quantjudge/2.playerBehavior/playerBehaviorRecordCard.dart';
import './mappedBehavior.dart';

class TurnInfo extends StatelessWidget {
  final int id;
  final int turn; // to be changed into turnselector object.

  final List<MappedBehavior> mappedBehaviors = [
    MappedBehavior(turn: 1, turnBehaviors: [
      Behavior(
        turn: 1,
        id: 1,
        player: 1,
        title: "坐姿表情",
        quantity: 50,
      ),
      Behavior(
        turn: 1,
        id: 2,
        player: 1,
        title: "发言逻辑",
        quantity: 50,
      ),
      Behavior(
        turn: 1,
        id: 3,
        player: 2,
        title: "站边举票",
        quantity: 50,
      ),
      Behavior(
        turn: 1,
        id: 4,
        player: 3,
        title: "站边举票行为",
        quantity: 40,
      ),
    ]),
    
    MappedBehavior(turn: 2, turnBehaviors: [
      Behavior(
        turn: 1,
        id: 1,
        player: 1,
        title: "坐姿表情2",
        quantity: 50,
      ),
      Behavior(
        turn: 1,
        id: 3,
        player: 2,
        title: "站边举票2",
        quantity: 50,
      ),
      Behavior(
        turn: 1,
        id: 4,
        player: 3,
        title: "站边举票行为2",
        quantity: 40,
      ),
    ]),

    MappedBehavior(turn: 2, turnBehaviors: [
      Behavior(
        turn: 1,
        id: 1,
        player: 1,
        title: "坐姿表情3",
        quantity: 50,
      ),
      Behavior(
        turn: 1,
        id: 3,
        player: 2,
        title: "站边举票3",
        quantity: 50,
      ),
    ]),

  ];

  /*
   * Constructor
   */
  TurnInfo(this.id, this.turn);

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
