import 'package:flutter/material.dart';
import 'package:werewolf_quantjudge/2.playerBehavior/2.1.playerRecord/playerBasicInfo.dart';
import 'package:werewolf_quantjudge/2.playerBehavior/2.1.playerRecord/playerBehaviorInfo.dart';
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
              PlayerBasicInfo(
                behavior.id,
                behavior.turn,
              ),
              // 2.1.2 Behavior Tag and quantity.
              PlayerBehaviorInfo(
                behavior.title,
                behavior.quantity,
                behavior.date,
              ),

              Row(
                children: <Widget>[
                  // 2.1.2.1
                  Container(child: Card(child: Text(behavior.title))),
                  // 2.1.2.2
                  Container(
                      child: Card(child: Text(behavior.quantity.toString()))),
                  // 2.1.2.3
                  Container(child: Card(child: Text(behavior.date.toString()))),
                ],
              )
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
