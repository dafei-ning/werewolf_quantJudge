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
          margin: EdgeInsets.only(top: 10, bottom: 5),
          child: TextField(
            decoration: InputDecoration(
              labelText: '玩家号码',
              labelStyle: Theme.of(context).textTheme.title,
              hintText: '输入某位玩家的号码, 例如: 1, 2...',
              hintStyle: TextStyle(fontSize: 13),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            controller: widget.playerInput,
            keyboardType: TextInputType.number,
          ),
        ),
        // 天数轮次
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 5),
          child: TextField(
            decoration: InputDecoration(
              labelText: '天数轮次',
              hintText: '输入发言轮次, 1, 2...或 0代表 \'警上\'',
              hintStyle: TextStyle(fontSize: 13),
              labelStyle: Theme.of(context).textTheme.title,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            controller: widget.turnInput,
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    );
  }
}
