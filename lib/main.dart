import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:werewolf_quantjudge/2.meetUp/meetUpHomePage.dart';
import 'package:werewolf_quantjudge/3.gameJudge/3.2.createRoom/createRoom.dart';
import 'package:werewolf_quantjudge/3.gameJudge/3.3.enterRoom/enterRoom.dart';
import 'package:werewolf_quantjudge/3.gameJudge/3.4.returnToRoom/ReturnRoom.dart';
import 'package:werewolf_quantjudge/3.gameJudge/3.5.checkHistory/checkHistory.dart';
import 'package:werewolf_quantjudge/3.gameJudge/gameIntroduction/gameIntroduction.dart';
import 'package:werewolf_quantjudge/3.gameJudge/judgeHomePage.dart';
import 'package:werewolf_quantjudge/4.scoreList/scoreListHomePage.dart';

import '0.category/catergories.dart';
import '1.behavior/behaviorHomePage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '湾区狼人杀',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.amber,
        //canvasColor: Color.fromRGBO(0, 0, 0, 1),
        canvasColor: Color.fromRGBO(255, 255, 255, 1),
        fontFamily: 'Quicksand',
        errorColor: Colors.red,
        textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: 'OpenSans',
              fontSize: 13,
            ),
            // 目前只应用在 Category
            display1: TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: 'OpenSans',
              fontSize: 20,
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
      initialRoute: '/',
      routes: {
        '/': (ctx) => CatergoriesScreen('湾区狼人杀'),
        /*
         * 首页 Categories
         */
        BehaviorHomePage.routeName: (ctx) => BehaviorHomePage('狼人杀玩家行为记录'),
        MeetUpHomePage.routeName: (ctx) => MeetUpHomePage('湾区狼人杀组局'),
        JudgeHomePage.routeName: (ctx) => JudgeHomePage('狼人杀小法官'),
        ScoreListHomePage.routeName: (ctx) => ScoreListHomePage('湾区狼人杀英雄榜'),
        /*
         * 3. 狼人杀小法官
         */
        CreateRoom.routeName: (ctx) => CreateRoom('配置房间'),
        EnterRoom.routeName: (ctx) => EnterRoom('进入房间'),
        ReturnRoom.routeName: (ctx) => CreateRoom('房间XXXXXXX'),
        CheckHistory.routeName: (ctx) => CheckHistory('游戏记录'),
        GameIntroduction.routeName: (ctx) => GameIntroduction('狼人杀游戏介绍')
      },
    );
  }
}
