import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:werewolf_quantjudge/3.gameJudge/3.2.createRoom/0.playerAmountChoose/playerAmountChoose.dart';
import 'package:werewolf_quantjudge/3.gameJudge/3.2.createRoom/1.teamConfigChoose/teamConfigChoose.dart';
import 'package:werewolf_quantjudge/3.gameJudge/3.2.createRoom/2.teamConfigDetail/teamConfigDetail.dart';
import '../../data/wolfDatabase.dart';
import '../../models/gameIntroModel.dart';
import '3.startGameButton/startGameButton.dart';

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
  GamePattern _gamePattern;

  void _setPlayerAmount(int amount) {
    setState(() {
      _playerAmount = amount;
    });
  }

  void _setGamePattern(GamePattern gamePattern) {
    setState(() {
      _gamePattern = gamePattern;
    });
  }

  void _submitAndStartGame() {
    final int selectedAmount = _playerAmount;
    final GamePattern selectedPattern = _gamePattern;
    if (selectedAmount == 0) {
      print('请选择游戏人数和板子配置');
      return;
    }
    if (selectedPattern == null) {
      print('请根据人数选择板子类型');
      return;
    }
    
  }
  
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget createRoomBar = CupertinoNavigationBar(
      middle: Text(widget.title),
    );
    var choiceCard = Card(
      margin: EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 30),
          PlayerAmountChoose(_setPlayerAmount),
          Container(
            margin: EdgeInsets.all(5),
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TeamConfigChoose(_playerAmount, _setGamePattern),
                Divider(),
                TeamConfigDetail(_playerAmount, _gamePattern),
              ],
            ),
          ),
          StartGameButton(_submitAndStartGame),
        ],
      ),
    );
    return Scaffold(
      appBar: createRoomBar,
      body: choiceCard,
    );
  }
}
