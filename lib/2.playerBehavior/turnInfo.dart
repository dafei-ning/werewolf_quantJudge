import 'package:flutter/material.dart';
import 'package:werewolf_quantjudge/2.playerBehavior/playerBehaviorRecordCard.dart';
import './behavior.dart';

class TurnInfo extends StatelessWidget {
  final int id;
  final int turn; // to be changed into turnselector object.

  final List<Behavior> mappedBehaviors = [
    mappedBehavior(
      id: 1,
      player: 1,
      turn: 1,
      title: '坐姿状态',
      quantity: 50,
      date: DateTime.now(),
    ),
    mappedBehavior(
      id: 2,
      player: 1,
      title: '发言逻辑',
      quantity: 30,
      date: DateTime.now(),
      turn: 1,
    ),
    mappedBehavior(
      id: 3,
      player: 2,
      title: '站边举票',
      quantity: 20,
      date: DateTime.now(),
      turn: 1,
    ),
    mappedBehavior(
      id: 4,
      player: 2,
      title: '站边举票',
      quantity: 20,
      date: DateTime.now(),
      turn: 2,
    ),
    mappedBehavior(
      id: 5,
      player: 3,
      title: '站边举票行为',
      quantity: 20,
      date: DateTime.now(),
      turn: 3,
    ),
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
