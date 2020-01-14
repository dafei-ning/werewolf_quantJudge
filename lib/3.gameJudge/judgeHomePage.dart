import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:werewolf_quantjudge/3.gameJudge/3.1.%20judgeCategory/judgeCategory.dart';
import 'package:werewolf_quantjudge/3.gameJudge/gameIntroduction/gameIntroduction.dart';
import 'dart:io';

import 'categoryNotice.dart';

class JudgeHomePage extends StatelessWidget {
  static const routeName = '/game-judge';
  final String title;

  JudgeHomePage(this.title);

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget meetupBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(title),
          )
        : AppBar(title: Text(title));
    var judgeCategory = Container(
      height: 200,
      alignment: Alignment.center,
      child: Flex(
        mainAxisAlignment: MainAxisAlignment.center,
        direction: Axis.vertical,
        children: <Widget>[
          Align(
            child: CategoryNotice(),
          ),
          Flexible(
            child: JudgeCategory(),
          ),
          Align(child: GameIntroduction(),),
        ],
      ),
    );

    return Scaffold(
      appBar: meetupBar,
      body: judgeCategory,
    );
  }
}
