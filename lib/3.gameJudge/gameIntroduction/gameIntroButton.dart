import 'package:flutter/material.dart';

class GameIntroButton extends StatelessWidget {
  final String title = "GameIntroduction";

  void selectJudgeCategory(BuildContext ctx) {
    print(ctx);
    Navigator.of(ctx).pushNamed(
      '/game-introduction',
      arguments: {'title': title},
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Text(title),
      color: Colors.teal[300],
    );
  }
}