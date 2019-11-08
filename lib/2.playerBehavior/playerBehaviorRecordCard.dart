import 'package:flutter/material.dart';
import './2.1.playerRecord/turnInfo.dart';
import './2.1.playerRecord/playerBehaviorInfo.dart';
import './behavior.dart';

class playerBehaviorRecordCard extends StatelessWidget {
  final Behavior behavior;

  /*
   * Constructor
   */
  playerBehaviorRecordCard(this.behavior);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(children: <Widget>[
          // 2.1 Character's behavior's record.
          Container(
            child: Column(children: <Widget>[
              // 2.1.1 角色信息
              TurnInfo(
                behavior.id,
                behavior.turn,
              ),

              // 2.1.2 Behavior Tag and quantity.
              PlayerBehaviorInfo(
                behavior.player,
                behavior.title,
                behavior.quantity,
                behavior.date,
              ),
            ]),
          ),
          // 2.2 增删查改按钮
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Card(child: Text("删除")),
              Card(child: Text("修改")),
            ],
          )
        ]),
      ),
    );
  }
}
