import 'package:flutter/material.dart';
import 'judgeCateItem.dart';

class JudgeCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var categoryBody = GridView(
      padding: const EdgeInsets.all(15),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 20,
        childAspectRatio: 2 / 2,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      children: <Widget>[
        JudgeCateItem("创建房间"),
        JudgeCateItem("进入房间"),
        JudgeCateItem("返回当前房间"),
      ],
    );

    return categoryBody;
  }
}
