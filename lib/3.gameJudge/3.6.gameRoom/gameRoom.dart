import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:werewolf_quantjudge/models/gameIntroModel.dart';

class GameRoom extends StatefulWidget {
  static const routeName = '/game-room';
  final String title;
  GameRoom(this.title);

  @override
  _GameRoomState createState() => _GameRoomState();
}

class _GameRoomState extends State<GameRoom> {
  // 预言家技能
  String _checkOnePlayer(int playerNumber, Map<int, Character> characterGroup) {
    Character pickedPlayer = characterGroup[playerNumber];
    if (pickedPlayer.seerSight == SeerSight.wolfMan) {
      return '狼人';
    }
    return '好人';
  }
  // 女巫技能
  



  @override
  Widget build(BuildContext context) {
    // A raised button 显示从黑商处获得的礼物
    var snackBar = SnackBar(
      content: Text('你获得了 猎人的抢！'),
      action: SnackBarAction(
        label: 'undo',
        onPressed: () {},
      ),
    );
    var showGiftFromMarketer = Builder(
      builder: (context) => Center(
        child: Container(
          child: RaisedButton(
            child: Text('显示获得的礼物'),
            onPressed: () {
              Scaffold.of(context).showSnackBar(snackBar);
            },
          ),
        ),
      ),
    );

    PreferredSizeWidget createRoomBar = CupertinoNavigationBar(
      middle: Text("hi"),
    );

    return Scaffold(
      appBar: createRoomBar,
      body: Container(
        child: showGiftFromMarketer,
      ),
    );
  }
}
