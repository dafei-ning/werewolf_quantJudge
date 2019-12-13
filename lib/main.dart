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
            button: TextStyle(color: Colors.yellow[600])),
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
  // List<MappedBehavior> mappedBehaviors = SimulateData().mappedBehaviors;

  /*  Properties. */
  List<MappedBehavior> mappedBehaviors = [];
  List<IndividualRecord> individualRecords = [];
  List<Behavior> behaviors = [];

  List<Behavior> behaviors2 = SimulateData().behaviors;
  // TODO: 是不是有更好的方法归类这一系列function？
  BehaviorController bhCtrl = new BehaviorController();

  void _addNewBehavior(
    int inTurn,
    int inPlayer,
    double inputScore,
    String describeTag,
  ) {
    final newBehavior = Behavior(
      // TODO: id to be iterated automatically.
      id: 888,
      turn: inTurn,
      player: inPlayer,
      quantity: inputScore,
      describeTab: describeTag,
      date: DateTime.now(),
    );
    setState(() {
      behaviors.add(newBehavior);
      mappedBehaviors = bhCtrl.mapAndAdd(mappedBehaviors, newBehavior);
      mappedBehaviors.sort((mb2, mb1) {
        return mb1.turn.compareTo(mb2.turn);
      });
      individualRecords =
          bhCtrl.groupedBehaviorValues(individualRecords, newBehavior);
      individualRecords.sort((ir1, ir2) {
        return ir1.player.compareTo(ir2.player);
      });
      //print("P1 indi: ${individualRecords[0].indBehaviorTotal}, max: ${individualRecords[0].maxBehaviorTotal}");
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
            Container(child: BehaviorChart(individualRecords)),

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
