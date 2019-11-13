import 'package:flutter/material.dart';
import '1.behaviorChart/behaviorChart.dart';
import '2.playerBehavior/turnInfo.dart';
import '3.behaviorInput/behaviorInput.dart';

import './2.playerBehavior/behavior.dart';
import './2.playerBehavior/mappedBehavior.dart';

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

  final List<MappedBehavior> mappedBehaviors = [
    MappedBehavior(
      turn: 1,
      turnBehaviors: [
        Behavior(
          turn: 1,
          id: 1,
          player: 1,
          title: "坐姿表情",
          quantity: 50,
          date: DateTime.now(),
        ),
        Behavior(
          turn: 1,
          id: 2,
          player: 1,
          title: "发言逻辑",
          quantity: 50,
          date: DateTime.now(),
        ),
        Behavior(
          turn: 1,
          id: 3,
          player: 2,
          title: "站边举票",
          quantity: 50,
          date: DateTime.now(),
        ),
        Behavior(
          turn: 1,
          id: 4,
          player: 3,
          title: "站边举票行为",
          quantity: 40,
          date: DateTime.now(),
        ),
      ],
    ),
    MappedBehavior(
      turn: 2,
      turnBehaviors: [
        Behavior(
          turn: 1,
          id: 1,
          player: 1,
          title: "坐姿表情2",
          quantity: 50,
          date: DateTime.now(),
        ),
        Behavior(
          turn: 1,
          id: 3,
          player: 2,
          title: "站边举票2",
          quantity: 50,
          date: DateTime.now(),
        ),
        Behavior(
          turn: 1,
          id: 4,
          player: 3,
          title: "站边举票行为2",
          quantity: 40,
          date: DateTime.now(),
        ),
      ],
    ),
    MappedBehavior(
      turn: 3,
      turnBehaviors: [
        Behavior(
          turn: 1,
          id: 1,
          player: 1,
          title: "坐姿表情3",
          quantity: 50,
          date: DateTime.now(),
        ),
        Behavior(
          turn: 1,
          id: 3,
          player: 2,
          title: "站边举票3",
          quantity: 50,
          date: DateTime.now(),
        ),
      ],
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
            // 1 最上面的显示玩家行为记录的chart
            Container(child: BehaviorChart()),

            // 3 用来增加玩家行为的输入框
            Container(child: BehaviorInput()),

            // 2 显示每一轮玩家的行为汇总
            Container(
              child: Column(
                // mbh -> turn, turnBehaviors
                children: mappedBehaviors.map((mbh) {
                  return Container(child: TurnInfo(mbh));
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
