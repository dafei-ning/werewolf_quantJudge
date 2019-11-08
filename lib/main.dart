import 'package:flutter/material.dart';
import './playerBehavior/behavior.dart';
import './playerBehavior/playerBehaviorRecordCard.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          // 1
          Container(
            width: double.infinity,
            height: 200,
            // This card contains bar graph which indicates dimensions of judge.
            child: Card(
              child: Text('这里放柱状图'),
              color: Colors.blueGrey,
              elevation: 2,
            ),
          ),
          // 2
          Column(
            children: behaviors.map((bh) {
              return playerBehaviorRecordCard(bh);
            }).toList(),
          )
        ],
      ),
    );
  }
}
