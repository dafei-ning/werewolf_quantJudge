import 'package:flutter/material.dart';
import 'package:werewolf_quantjudge/models/gameIntroModel.dart';
import 'teamDetail.dart';

class ConfigDetail extends StatelessWidget {
  final CharacterSet characterSet;
  ConfigDetail(this.characterSet);

  @override
  Widget build(BuildContext context) {
    var wolvesSet = [characterSet.wolves];
    var goodMenSet = [characterSet.specials, characterSet.villagers];
    var unknownSet = [];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TeamDetail('wolf', wolvesSet),
        Container(
          child: Text(''),
        ),
        SizedBox(height: 10),
        SizedBox(height: 10),
        Container(
          child: Text("未知身份"),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
