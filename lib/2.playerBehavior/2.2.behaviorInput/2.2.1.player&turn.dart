import 'package:flutter/material.dart';

class PlayerAndTurn extends StatefulWidget {
  PlayerAndTurn(this.playerInput, this.turnInput);
  TextEditingController playerInput;
  TextEditingController turnInput;
  @override
  _PlayerAndTurn createState() => _PlayerAndTurn();
}

class _PlayerAndTurn extends State<PlayerAndTurn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: TextField(
            decoration: InputDecoration(
                labelText: '玩家号码', hintText: '输入某位玩家的号码, 例如: 1, 2...'),
            controller: widget.playerInput,
            keyboardType: TextInputType.number,
          ),
        ),
        // 天数轮次
        Container(
          child: TextField(
            decoration: InputDecoration(labelText: '天数轮次'),
            controller: widget.turnInput,
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    );
  }
}
