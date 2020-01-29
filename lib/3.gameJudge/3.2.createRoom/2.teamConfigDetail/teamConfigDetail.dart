import 'package:flutter/material.dart';
import 'package:werewolf_quantjudge/models/gameIntroModel.dart';

class TeamConfigDetail extends StatelessWidget {
  final int playerAmount;
  final GamePattern gamePattern;
  TeamConfigDetail(this.playerAmount, this.gamePattern);

  @override
  Widget build(BuildContext context) {
    var teamDetail = Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 6),
          child: Text(
            '配置介绍',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );

    return Container(
      height: 150,
      alignment: Alignment.centerLeft,
      child: teamDetail,
    );
  }
}
