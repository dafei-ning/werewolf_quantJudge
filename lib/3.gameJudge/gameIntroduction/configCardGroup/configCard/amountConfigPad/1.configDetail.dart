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
        TeamDetail('wolf', wolvesSet),
        SizedBox(height: 10),
        TeamDetail('good', goodMenSet),
        SizedBox(height: 10),
        TeamDetail('third', unknownSet),
        SizedBox(height: 10),
      ],
    );
  }
}
