import 'package:flutter/material.dart';
import './1.behaviorChart/behaviorChart.dart';
import './2.playerBehavior/playerBehaviorRecordCard.dart';

import './2.playerBehavior/behavior.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage('角色行为量化判断记录'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  /*
   *  Class properties
   */
  final String title;
  final List<Behavior> behaviors = [
    Behavior(
      id: 1,
      player: 1,
      turn: '第2.2轮',
      title: '坐姿状态',
      quantity: 50,
      date: DateTime.now(),
    ),
    Behavior(
      id: 2,
      player: 1,
      title: '发言逻辑',
      quantity: 30,
      date: DateTime.now(),
      turn: '第1轮',
    ),
    Behavior(
      id: 3,
      player: 2,
      title: '站边举票行为',
      quantity: 20,
      date: DateTime.now(),
      turn: '第2轮',
    ),
  ];

  /*
   * Constructor
   */
  MyHomePage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // 1
            Container(
              child: BehaviorChart(),
            ),
            // 2
            Container(
              child: Column(
                children: behaviors.map((bh) {
                  return Container(child: playerBehaviorRecordCard(bh));
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
