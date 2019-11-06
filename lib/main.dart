import 'package:flutter/material.dart';
import './behavior.dart';

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            // This card contains bar graph which indicates dimensions of judge.
            child: Card(
              child: Text('这里放柱状图'),
              color: Colors.blueGrey,
              elevation: 2,
            ),
          ),
          Column(
            children: behaviors.map((bh) {
              return Card(
                child: Row(
                  children: <Widget>[
                    // Character's behavior's record.
                    Column(
                      children: <Widget>[
                        // 角色号码
                        Row(
                          children: <Widget>[
                            Card(child: Text(bh.id.toString())),
                            Card(child: Text(bh.turn)),
                          ],
                        ),
                        // Behavior Tag and quantity.
                        Row(
                          children: <Widget>[
                            Card(
                              child: Text(bh.title),
                            ),
                            Card(
                              child: Text(bh.quantity.toString()),
                            ),
                          ],
                        )
                      ],
                    ),
                    // 增删查改按钮
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
            }).toList(),
          )
        ],
      ),
    );
  }
}
