import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:werewolf_quantjudge/3.switchToRound/roundTable.dart';

import '1.behaviorChart/behaviorChart.dart';
import '2.playerBehavior/turnInfoGroup.dart';
import '2.playerBehavior/2.2.behaviorInput/behaviorInput.dart';
import 'switchButton.dart';
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
    /*
     * Variables. 用来助于显示界面的var.
     */
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
    var _switchButtonBottom = SwitchButton(_switchTheChart, _showRoundTable);

    /*
     * 根据底部的 switchButton 用来选择 behaviors/RoundTable.
     */
    var _playerBehaviors = SafeArea(
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
              child: _switchButtonBottom,
            ),
          ],
        ),
      ),
    );
    var _roundTable = SafeArea(
      child: RoundTable(avaliableHeight, _switchButtonBottom),
    );
    var appBody = _showRoundTable ? _roundTable : _playerBehaviors;

    /*
     * 最终显示于手机中的
     */
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
