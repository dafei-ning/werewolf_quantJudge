import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class StartGameButton extends StatelessWidget {
  final Function submitAndStartGame;
  StartGameButton(this.submitAndStartGame);

  @override
  Widget build(BuildContext context) {

    var button = Platform.isIOS
        ? CupertinoButton(
            onPressed: submitAndStartGame,
            color: Theme.of(context).textTheme.button.color,
            child: Text(
              '开始游戏',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          )
        : RaisedButton(
            onPressed: submitAndStartGame,
            color: Theme.of(context).textTheme.button.color,
            child: Text(
              '开始游戏',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          );

    return Container(
      //color: Colors.blueAccent,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(20),
      child: button,
    );
  }
}