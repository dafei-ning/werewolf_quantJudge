import 'package:flutter/material.dart';
import './behavior.dart';

class playerBehaviorRecordCard extends StatelessWidget {
  final List<Behavior> behaviors = [
    Behavior(
      id: '1',
      title: '坐姿状态',
      quantity: 50,
      date: DateTime.now(),
      turn: '第2轮',
    ),
    Behavior(
      id: '2',
      title: '发言逻辑',
      quantity: 30,
      date: DateTime.now(),
      turn: '第1轮',
    ),
    Behavior(
      id: '3',
      title: '站边举票行为',
      quantity: 20,
      date: DateTime.now(),
      turn: '第2轮',
    ),
  ];

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
                  Container(child: Text(bh.id.toString())),

                  // 2.1.1.2 角色轮数
                  Container(child: Card(child: Text(bh.turn))),
                ],
              ),
              // 2.1.2 Behavior Tag and quantity.
              Row(
                children: <Widget>[
                  // 2.1.2.1
                  Container(child: Card(child: Text(bh.title))),
                  // 2.1.2.2
                  Container(child: Card(child: Text(bh.quantity.toString()))),
                  // 2.1.2.3
                  Container(child: Card(child: Text(bh.date.toString()))),
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
