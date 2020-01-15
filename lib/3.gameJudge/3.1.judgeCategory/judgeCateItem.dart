import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JudgeCateItem extends StatelessWidget {
  final String title;
  final Color color;
  final String routeName;

  JudgeCateItem(this.title, this.color, this.routeName);

  void selectJudgeCategory(BuildContext ctx) {
    print(ctx);
    Navigator.of(ctx).pushNamed(
      routeName,
      arguments: {'title': title},
    );
  }

  @override
  Widget build(BuildContext context) {
    var cateButtonIOS = FlatButton(
      onPressed: () => selectJudgeCategory(context),
      color: color,
      child: Text(title),
    );
    var cateButtonAndroid = InkWell(
      onTap: () => selectJudgeCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );

    return Container(
      child: Platform.isIOS ? cateButtonIOS : cateButtonAndroid,
    );
  }
}
