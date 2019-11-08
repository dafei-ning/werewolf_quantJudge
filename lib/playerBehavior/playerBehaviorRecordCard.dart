import 'package:flutter/material.dart';
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
      child: Row(
        children: <Widget>[
          // 2.1 Character's behavior's record.
          Column(
            children: <Widget>[
              // 2.1.1 角色信息
              Row(
                children: <Widget>[
                  // 2.1.1.1 角色号码
                  Container(child: Text(behavior.id.toString())),

                  // 2.1.1.2 角色轮数
                  Container(child: Card(child: Text(behavior.turn))),
                ],
              ),
              // 2.1.2 Behavior Tag and quantity.
              Row(
                children: <Widget>[
                  // 2.1.2.1
                  Container(child: Card(child: Text(behavior.title))),
                  // 2.1.2.2
                  Container(child: Card(child: Text(behavior.quantity.toString()))),
                  // 2.1.2.3
                  Container(child: Card(child: Text(behavior.date.toString()))),
                ],
              )
            ],
          ),
          // 2.2 增删查改按钮
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Card(child: Text("删除")),
              Card(child: Text("修改")),
            ],
          )
        ],
      ),
    );
  }
}
