import 'package:flutter/material.dart';
import 'package:werewolf_quantjudge/models/gameIntroModel.dart';

class ConfigCard extends StatelessWidget {
  final int playerAmount;
  final CharacterSet characterSet;
  ConfigCard(this.playerAmount, this.characterSet);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        
        children: <Widget>[
          // 人数
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              playerAmount.toString() + "人板子: ",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            ),
            width: 70,
          ),
          // 狼队
          Container(
            margin: EdgeInsets.only(left: 2),
            child: Text(
              "狼队配置",
              style: Theme.of(context).textTheme.title,
            ),
            width: 90,
          ),
          // 神队
          Container(
            margin: EdgeInsets.only(left: 2),
            child: Text(
              "神牌配置",
              style: Theme.of(context).textTheme.title,
            ),
            width: 90,
          ),
          // 民队
          Container(
            margin: EdgeInsets.only(left: 2),
            child: Text(
              "民牌配置",
              style: Theme.of(context).textTheme.title,
            ),
            width: 90,
          ),
        ],
      ),
    );
  }
}
