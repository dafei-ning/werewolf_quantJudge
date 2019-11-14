import 'package:flutter/material.dart';
import '../models/mappedBehavior.dart';
import 'package:werewolf_quantjudge/2.playerBehavior/playerBehaviorRecordCard.dart';
import '2.0.turnTitle.dart';
import '../models/mappedBehavior.dart';

class TurnInfoGroup extends StatelessWidget {
  /*
   * Properties.
   */
  final List<MappedBehavior> mappedBehaviors;

  /*
   * Constructor
   */
  TurnInfoGroup(this.mappedBehaviors);

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
              child: Column(children: <Widget>[
                // 轮数
                Container(child: TurnTitle(mappedBehavior.turn)),

                // 每一轮的用户行为
                Container(
                  child: PlayerBehaviorRecordCardGroup(mappedBehavior.turnBehaviors)
                )
              ]),
            ),
          ),
        );
      }).toList(),
    );
  }
}
