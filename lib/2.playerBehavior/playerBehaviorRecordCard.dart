import 'package:flutter/material.dart';
import './2.1.playerRecord/playerBehaviorInfo.dart';
import './behavior.dart';

class PlayerBehaviorRecordCard extends StatelessWidget {
  final Behavior behavior;
  /*
   * Constructor
   */
  PlayerBehaviorRecordCard(this.behavior);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(children: <Widget>[
          // 2.1 Character's behavior's record.
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 1,
              horizontal: 2,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black12,
                width: 1,
              ),
            ),
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Card(child: Text("删除")),
                Card(child: Text("修改")),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
