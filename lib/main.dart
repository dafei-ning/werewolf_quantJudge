import 'package:flutter/material.dart';
import 'models/data.dart';
import '1.behaviorChart/behaviorChart.dart';
import '2.playerBehavior/turnInfoGroup.dart';

import 'models/mappedBehavior.dart';

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
  /* Class properties */
  final String title;
  
  /* Constructor */
  MyHomePage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // 1 最上面的显示玩家行为记录的chart
            Container(child: BehaviorChart()),

            // 2 显示每一轮玩家的行为汇总(组)
            Container(child: TurnInfoGroup())
          ],
        ),
      ),
    );
  }
}
