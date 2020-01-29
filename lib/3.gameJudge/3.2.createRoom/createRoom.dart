import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:werewolf_quantjudge/3.gameJudge/3.2.createRoom/0.playerAmountChoose/playerAmountChoose.dart';
import 'package:werewolf_quantjudge/3.gameJudge/3.2.createRoom/1.choiceChipGroup.dart';
import 'package:werewolf_quantjudge/3.gameJudge/3.2.createRoom/1.teamConfigChoose/configChip.dart';
import 'package:werewolf_quantjudge/3.gameJudge/3.2.createRoom/1.teamConfigChoose/teamConfigChoose.dart';
import 'package:werewolf_quantjudge/3.gameJudge/3.2.createRoom/2.teamConfigDetail/teamConfigDetail.dart';
import '../../data/wolfDatabase.dart';
import '../../models/gameIntroModel.dart';

final List<AmountConfiguration> acs = WolfDataBase().amountConfigurations;
final List<CharacterConfiguration> configs =
      WolfDataBase().characterConfigurations;

class CreateRoom extends StatefulWidget {
  static const routeName = '/create-room';
  final String title;

  CreateRoom(this.title);

  @override
  _CreateRoomState createState() => _CreateRoomState();
}

class _CreateRoomState extends State<CreateRoom> {
  
  int _playerAmount = 0;
  //ConfigChip _configChip = null;

  void _setPlayerAmount(int amount) {
    setState(() {
      _playerAmount = amount;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget createRoomBar = CupertinoNavigationBar(
      middle: Text(widget.title),
    );
    var choiceCard = Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          PlayerAmountChoose(_setPlayerAmount),
          Container(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TeamConfigChoose(_playerAmount),
                TeamConfigDetail(),
              ],
            ),
          ),
        ],
      ),
    );
    return Scaffold(
      appBar: createRoomBar,
      body: choiceCard,
    );
  }
}
