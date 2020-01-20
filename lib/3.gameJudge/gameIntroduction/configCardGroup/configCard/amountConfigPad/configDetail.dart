import 'package:flutter/material.dart';
import 'package:werewolf_quantjudge/3.gameJudge/gameIntroduction/configCardGroup/configCard/amountConfigPad/teamDetail.dart';
import 'package:werewolf_quantjudge/models/gameIntroModel.dart';

class ConfigDetail extends StatelessWidget {
  final CharacterSet characterSet;
  ConfigDetail(this.characterSet);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TeamDetail(characterSet.wolves),
        SizedBox(height: 10),
        TeamDetail(characterSet.wolves),
        SizedBox(height: 10),
        Container(
          child: Text("未知身份"),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
