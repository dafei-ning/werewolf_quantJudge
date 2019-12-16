import 'package:flutter/material.dart';
import '1.behaviorChart/behaviorChart.dart';
import '2.playerBehavior/turnInfoGroup.dart';
import '2.playerBehavior/2.2.behaviorInput/behaviorInput.dart';
import 'models/mappedBehavior.dart';
import 'models/behavior.dart';
import 'models/individual.dart';
import 'controllers/behaviorController.dart';
import 'package:uuid/uuid.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '湾区狼人杀',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        //errorColor: Colors.red,
        textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: 'OpenSans',
              fontSize: 13,
            ),
            button: TextStyle(color: Colors.amber)),
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
      home: MyHomePage('狼人杀玩家行为量化记录'),
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
  List<IndividualRecord> individualRecords = [];
  List<Behavior> behaviors = [];
  BehaviorController bhCtrl = new BehaviorController();
  var uuid = Uuid();
  // List<Behavior> behaviors2 = SimulateData().behaviors;
  // List<MappedBehavior> mappedBehaviors = SimulateData().mappedBehaviors;
  
  void _addNewBehavior(
    int inTurn,
    int inPlayer,
    double inputScore,
    String describeTag,
  ) {
    final newBehavior = Behavior(
      id: uuid.v4(),
      turn: inTurn,
      player: inPlayer,
      quantity: inputScore,
      describeTab: describeTag,
      date: DateTime.now(),
    );
    setState(() {
      behaviors.add(newBehavior);
      mappedBehaviors = bhCtrl.mapAndAdd(
        mappedBehaviors,
        newBehavior,
      );
      individualRecords = bhCtrl.groupedBehaviorValues(
        individualRecords,
        newBehavior,
      );
      print(newBehavior.id);
    });
  }

  void _deleteBehavior(int id) {
    setState(() {
      behaviors.removeWhere((bh) => bh.id == id);
      mappedBehaviors = bhCtrl.deleteAndRemap(
        mappedBehaviors,
        id,
      );
      individualRecords = bhCtrl.regroupedBehaviorsAfterDelete(
        individualRecords,
        id,
      );
    });
  }

  void _startInputNewBehavior(BuildContext ctx) {
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
            onPressed: () => _startInputNewBehavior(context),
          )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // 1 最上面的显示玩家行为记录的chart
            Container(child: BehaviorChart(individualRecords)),

            // 2 显示每一轮玩家的行为汇总(组) ListView必须规定需要render的范围 -> 设置ListView高度
            Container(child: TurnInfoGroup(mappedBehaviors))
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startInputNewBehavior(context),
      ),
    );
  }
}
