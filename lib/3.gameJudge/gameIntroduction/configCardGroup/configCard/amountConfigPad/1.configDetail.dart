import 'package:flutter/material.dart';
import 'package:werewolf_quantjudge/models/gameIntroModel.dart';
import '1.1.teamDetail.dart';

class ConfigDetail extends StatelessWidget {
  final CharacterSet characterSet;
  ConfigDetail(this.characterSet);

  @override
  Widget build(BuildContext context) {
    var wolvesSet = [characterSet.wolves];
    var goodMenSet = [characterSet.specials, characterSet.villagers];
    var unknownSet =
        characterSet.thirdParties == null ? null : [characterSet.thirdParties];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[   
        TeamDetail('狼队', wolvesSet),
        SizedBox(height: 10),
        TeamDetail('好人队', goodMenSet),
        SizedBox(height: 10),
        TeamDetail('未知站边身份', unknownSet),
        SizedBox(height: 10),
      ],
    );
  }
}
