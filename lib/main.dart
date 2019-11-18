import 'package:flutter/material.dart';
import '1.behaviorChart/behaviorChart.dart';
import '2.playerBehavior/turnInfoGroup.dart';
import '2.playerBehavior/2.2.behaviorInput/behaviorInput.dart';
import 'models/data.dart';
import 'models/mappedBehavior.dart';
import 'models/behavior.dart';
import 'controllers/behaviorController.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState('角色行为量化判断记录');
}

class _MyHomePageState extends State<MyHomePage> {
  /* Class properties */
  final String title;
  /* Constructor */
  _MyHomePageState(this.title);

  /*  Properties. */
  List<MappedBehavior> mappedBehaviors = SimulateData().mappedBehaviors;
  final List<Behavior> behaviors = SimulateData().behaviors;
  // TODO: 是不是有更好的方法归类这一系列function？
  BehaviorController bhObject = new BehaviorController();
  void _addNewBehavior(
      int inTurn, int inPlayer, String inDescribeTab, double inQuantity) {
    final newBehavior = Behavior(
      // TODO: id to be iterated automatically.
      id: 888,
      turn: inTurn,
      player: inPlayer,
      describeTab: inDescribeTab,
      quantity: inQuantity,
      date: DateTime.now(),
    );
    setState(() {
      behaviors.add(newBehavior);
      mappedBehaviors = bhObject.mapAndAdd(mappedBehaviors, newBehavior);
    });
  }

  void startInputNewBehavior(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (bCtx) {
        return Container(child: BehaviorInput(_addNewBehavior));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_box),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // 1 最上面的显示玩家行为记录的chart
            Container(child: BehaviorChart()),

            // 2 显示每一轮玩家的行为汇总(组) ListView必须规定需要render的范围 -> 设置ListView高度
            Container(child: TurnInfoGroup())
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_box),
        onPressed: () {},
      ),
    );
  }
}
