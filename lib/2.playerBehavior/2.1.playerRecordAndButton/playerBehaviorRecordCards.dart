import 'package:flutter/material.dart';
import './2.1.1.playerBehaviorInfo.dart';
import '../../models/behavior.dart';
import '2.1.2.cardButton/cardButton.dart';

class PlayerBehaviorRecordCardGroup extends StatelessWidget {
  final List<Behavior> turnBehaviors;
  /* Constructor */
  PlayerBehaviorRecordCardGroup(this.turnBehaviors);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: turnBehaviors.map((behavior) {
        return Container(
          child: Card(
            child: Container(
              child: Row(
                children: <Widget>[
                  // 2.1 Character's behavior's record.
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 1, horizontal: 2),
                    padding: EdgeInsets.all(0.5),
                    child: PlayerBehaviorInfo(behavior),
                  ),

                  // 2.2 增删查改按钮
                  Expanded(
                    child: CardButton(),
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
