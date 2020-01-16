import 'package:flutter/material.dart';
import 'dart:io';

class GameIntroButton extends StatelessWidget {
  final String title = "GameIntroduction";
  final Color gameIntroButtonColor = Colors.teal[500];

  void selectJudgeCategory(BuildContext ctx) {
    print(ctx);
    Navigator.of(ctx).pushNamed(
      '/game-introduction',
      arguments: {'title': title},
    );
  }

  @override
  Widget build(BuildContext context) {
    var gaIntroBuIOS = FlatButton(
      padding: const EdgeInsets.all(25),
      onPressed: () => selectJudgeCategory(context),
      color: gameIntroButtonColor,
      child: Text(title),
    );
    var gaIntroBuAndroid = InkWell(
      onTap: () => selectJudgeCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(5),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              gameIntroButtonColor.withOpacity(0.7),
              gameIntroButtonColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );

    return Container(
      child: Platform.isIOS ? gaIntroBuIOS : gaIntroBuAndroid,
    );
  }
}
