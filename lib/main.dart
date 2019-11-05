import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: '角色行为量化判断记录'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
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
          Card(
            child: Text('这里是角色的属性'),
            elevation: 2,
          ),
        ],
      ),
    );
  }
}
