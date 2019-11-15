import 'package:flutter/material.dart';
import '../models/mappedBehavior.dart';
import '2.1.playerRecordAndButton/playerBehaviorRecordCards.dart';
import '2.0.turnTitle.dart';
import '2.2.behaviorInput/behaviorInput.dart';


class TurnInfoGroup extends StatelessWidget {
  /*  Properties. */
  final List<MappedBehavior> mappedBehaviors;

  /* Constructor. */
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
              child: Column(
                children: <Widget>[
                  // 2.0. 轮数
                  Container(child: TurnTitle(mappedBehavior.turn)),

                  // 2.1. 每一轮的用户行为(组)
                  Container(
                    child: PlayerBehaviorRecordCardGroup(
                        mappedBehavior.turnBehaviors),
                  ),
                  // 2.2. 用来增加玩家行为的输入框
                  Container(child: BehaviorInput()),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
