import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '1.behaviorChart/behaviorChart.dart';
import '2.playerBehavior/turnInfoGroup.dart';
import '2.playerBehavior/2.2.behaviorInput/behaviorInput.dart';
import '3.switchToRound/switchButton.dart';
import 'models/mappedBehavior.dart';
import 'models/behavior.dart';
import 'models/individual.dart';
import 'controllers/behaviorController.dart';

import 'models/simulatedData.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

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
  bool _showRoundTable = false;

  // List<Behavior> behaviors = SimulateData().behaviors;
  // List<MappedBehavior> mappedBehaviors = SimulateData().mappedBehaviors;
  // List<IndividualRecord> individualRecords = SimulateData().individualRecords;

  void _addNewBehavior(Behavior newBehavior) {
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
    });
  }

  void _deleteBehavior(Behavior behavior) {
    setState(() {
      behaviors.removeWhere((bh) => bh.id == behavior.id);
      mappedBehaviors = bhCtrl.deleteFromMappedBH(
        mappedBehaviors,
        behavior,
      );
      individualRecords = bhCtrl.regroupedIndividualRecordsAfterDelete(
        individualRecords,
        behavior,
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

  void _switchTheChart(bool currentShow) {
    setState(() {
      _showRoundTable = currentShow;
      print('current _showRoundTable is: ${_showRoundTable}');
    });
  }

  @override
  Widget build(BuildContext context) {
    // 最上面的 app bar
    PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(widget.title),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  child: Icon(CupertinoIcons.add_circled),
                  onTap: () => _startInputNewBehavior(context),
                ),
              ],
            ),
          )
        : AppBar(
            title: Text(widget.title),
            actions: <Widget>[
              IconButton(
                iconSize: 28,
                icon: Icon(Icons.add_box),
                onPressed: () => _startInputNewBehavior(context),
              )
            ],
          );
    var avaliableHeight = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    var avaliableWidth = MediaQuery.of(context).size.width;
    var playerBehaviors = SafeArea(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // 1 最上面的显示玩家行为记录的chart
            Container(
              height: avaliableHeight * 0.25,
              child: BehaviorChart(individualRecords),
            ),
            // 2 显示每一轮玩家的行为汇总(组) ListView必须规定需要render的范围 -> 设置ListView高度
            Container(
              height: avaliableHeight * 0.70,
              child: TurnInfoGroup(mappedBehaviors, _deleteBehavior),
            ),
            Container(
              height: avaliableHeight * 0.05,
              child: SwitchButton(_switchTheChart, _showRoundTable),
            ),
          ],
        ),
      ),
    );

    var _roundTable = SafeArea(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: avaliableHeight * 0.95,
              color: Colors.blue[600],
              alignment: Alignment.center,
              child: Container(
                //width: 700,
                //height: avaliable * 0.,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(15.0),
                color: const Color(0xFFE8581C),
                child: const Text('Apartment for rent!'),
              ),
            ),
            Container(
              height: avaliableHeight * 0.05,
              child: SwitchButton(_switchTheChart, _showRoundTable),
            ),
          ],
        ),
      ),
    );

    var appBody = _showRoundTable ? _roundTable : playerBehaviors;

    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: appBar,
            child: appBody,
          )
        : Scaffold(
            appBar: appBar,
            body: appBody,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () => _startInputNewBehavior(context),
                  ),
          );
  }
}
