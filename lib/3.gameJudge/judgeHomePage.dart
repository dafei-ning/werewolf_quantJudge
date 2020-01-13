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

    var judgeCategory = SafeArea(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            CategoryNotice(),
            JudgeCategory(),
            GameIntroduction(),
          ],
        ),
      ),
    );
    return Scaffold(
      appBar: meetupBar,
      body: judgeCategory,
    );
  }
}
