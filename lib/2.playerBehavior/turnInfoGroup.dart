import 'package:flutter/material.dart';
import 'package:werewolf_quantjudge/models/behavior.dart';
import '../models/mappedBehavior.dart';
import '2.1.playerRecordAndButton/playerBehaviorRecordCards.dart';
import '2.0.turnTitle.dart';
import '2.2.behaviorInput/behaviorInput.dart';
import '../models/data.dart';

class TurnInfoGroup extends StatefulWidget {
  @override
  _TurnInfoGroupState createState() => _TurnInfoGroupState();
}

class _TurnInfoGroupState extends State<TurnInfoGroup> {
  /*  Properties. */
  final List<MappedBehavior> mappedBehaviors = SimulateData().mappedBehaviors;
  final List<Behavior> behaviors = SimulateData().behaviors;

  void _addNewBehavior(int inTurn, int inPlayer, String inDescribeTab, double inQuantity) {
    final newBehavior = Behavior(
      // id to be iterated automatically.
      id: 888,
      turn: inTurn,
      player: inPlayer,
      describeTab: inDescribeTab,
      quantity: inQuantity,
      date: DateTime.now(),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: mappedBehaviors.map((mappedBehavior) {
        return Container(
          child: Card(
            child: Container(
              // turnInfo's decoration.
              width: 350,
              margin: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
              child: Column(
                children: <Widget>[
                  // 2.0. 轮数
                  Container(child: TurnTitle(mappedBehavior.turn)),

                  // 2.2. 用来增加玩家行为的输入框
                  Container(child: BehaviorInput()),

                  // 2.1. 每一轮的用户行为(组)
                  Container(
                    child: PlayerBehaviorRecordCardGroup(
                        mappedBehavior.turnBehaviors),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
