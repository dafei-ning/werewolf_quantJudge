import 'package:flutter/material.dart';

class PlayerSeat extends StatelessWidget {
  final int playerNumber;
  PlayerSeat(this.playerNumber);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Container(
          child: Row(
            children: <Widget>[
              // 玩家号码 1
              Container(
                child: Text('Player.${playerNumber}'),
              ),
              // 玩家身份 狼人/预言家
              Container(
                child: Text('狼人/预言家'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
