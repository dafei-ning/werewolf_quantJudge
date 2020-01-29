import 'package:flutter/material.dart';

class StartGameButton extends StatelessWidget {
  final Function submitAndStartGame;
  StartGameButton(this.submitAndStartGame);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      child: Text('开始游戏吧'),
    );
  }
}