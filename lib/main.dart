import 'package:flutter/material.dart';
import '1.behaviorChart/behaviorChart.dart';
import '2.playerBehavior/turnInfoGroup.dart';
import '2.playerBehavior/2.2.behaviorInput/behaviorInput.dart';
import 'models/data.dart';
import 'models/mappedBehavior.dart';
import 'models/behavior.dart';
import 'models/individual.dart';
import 'controllers/behaviorController.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '狼人杀记录器',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: 'OpenSans',
                fontSize: 13,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      home: MyHomePage('角色行为量化判断记录ABC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage(this.title);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /*  Properties. */
  List<MappedBehavior> mappedBehaviors = [];
  Map<int, IndividualRecord> individualRecords = {};
  //List<MappedBehavior> mappedBehaviors = SimulateData().mappedBehaviors;
  final List<Behavior> behaviors = SimulateData().behaviors;

  // TODO: 是不是有更好的方法归类这一系列function？
  BehaviorController bhController = new BehaviorController();

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
      mappedBehaviors = bhController.mapAndAdd(mappedBehaviors, newBehavior);
      individualRecords = bhController.groupedBehaviorValues(individualRecords, newBehavior)
    });
  }

  void startInputNewBehavior(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: BehaviorInput(_addNewBehavior),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_box),
            onPressed: () => startInputNewBehavior(context),
          )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // 1 最上面的显示玩家行为记录的chart
            Container(child: BehaviorChart(behaviors)),

            // 2 显示每一轮玩家的行为汇总(组) ListView必须规定需要render的范围 -> 设置ListView高度
            Container(child: TurnInfoGroup(mappedBehaviors))
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => startInputNewBehavior(context),
      ),
    );
  }
}
