import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:werewolf_quantjudge/3.gameJudge/3.2.createRoom/0.playerAmountChoose/playerAmountChoose.dart';
import 'package:werewolf_quantjudge/3.gameJudge/3.2.createRoom/1.choiceChipGroup.dart';
import 'package:werewolf_quantjudge/3.gameJudge/3.2.createRoom/1.teamConfigChoose/teamConfigChoose.dart';
import 'package:werewolf_quantjudge/3.gameJudge/3.2.createRoom/2.teamConfigDetail/teamConfigDetail.dart';
import '../../data/wolfDatabase.dart';
import '../../models/gameIntroModel.dart';

class CreateRoom extends StatelessWidget {
  static const routeName = '/create-room';
  final String title;
  final List<CharacterConfiguration> configs =
      WolfDataBase().characterConfigurations;

  CreateRoom(this.title);

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget createRoomBar = CupertinoNavigationBar(
      middle: Text(title),
    );

    var choiceCard = Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          PlayerAmountChoose(),
          Container(
              child: Column(children: <Widget>[
            TeamConfigChoose(),
            TeamConfigDetail(),
          ])),
        ],
      ),
    );

    return Scaffold(
      appBar: createRoomBar,
      body: choiceCard,
    );
  }
}
