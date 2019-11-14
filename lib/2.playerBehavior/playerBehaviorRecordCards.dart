import 'package:flutter/material.dart';
import './2.1.playerRecord/playerBehaviorInfo.dart';
import '../models/behavior.dart';

class PlayerBehaviorRecordCardGroup extends StatelessWidget {
  final List<Behavior> turnBehaviors;
  /*
   * Constructor
   */
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
                    child: PlayerBehaviorInfo(
                      behavior.player,
                      behavior.title,
                      behavior.quantity,
                      behavior.date,
                    ),
                  ),

                  // 2.2 增删查改按钮
                  Container(
                    width: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Card(child: Text("修改")),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
