import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '3.switchToRound/roundTable.dart';

import '1.behaviorChart/behaviorChart.dart';
import '2.playerBehavior/turnInfoGroup.dart';
import '2.playerBehavior/2.2.behaviorInput/behaviorInput.dart';
import 'switchButton.dart';
import '../models/mappedBehavior.dart';
import '../models/behavior.dart';
import '../models/individual.dart';
import '../controllers/behaviorController.dart';

import '../data/simulatedData.dart';

class BehaviorHomePage extends StatefulWidget {
  static const routeName = '/behavior-HomePage';

  final String title;
  BehaviorHomePage(this.title);

  @override
  _BehaviorHomePageState createState() => _BehaviorHomePageState();
}

class _BehaviorHomePageState extends State<BehaviorHomePage> {
  /*  Properties. */
  BehaviorController bhCtrl = new BehaviorController();
  bool _showRoundTable = false;

  List<MappedBehavior> mappedBehaviors = [];
  List<IndividualRecord> individualRecords = [];
  List<Behavior> behaviors = [];

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
    // final routeArgs =
    //     ModalRoute.of(context).settings.arguments as Map<String, String>;
    // final categoryTitle = routeArgs['title'];
    // final categoryId = routeArgs['id'];
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
