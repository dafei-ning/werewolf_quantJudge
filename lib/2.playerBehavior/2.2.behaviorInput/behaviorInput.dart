import 'package:flutter/material.dart';

class BehaviorInput extends StatefulWidget {
  final Function inputFunction;
  /* User input properties. */

  BehaviorInput(this.inputFunction);

  @override
  _BehaviorInputState createState() => _BehaviorInputState();
}

class _BehaviorInputState extends State<BehaviorInput> {
  final turnInputController = TextEditingController();
  final describeInputController = TextEditingController();
  final playerInputController = TextEditingController();
  final scoreInputController = TextEditingController();

  void _submitData() {
    final inputTurn = int.parse(turnInputController.text);
    final inputPlayer = int.parse(playerInputController.text);
    final inputDescribe = describeInputController.text;
    final inputScore = double.parse(scoreInputController.text);

    // Error protection.
    if (!(inputTurn is int) || !(inputPlayer is int) || !(inputScore is double))
      return;
    if (inputTurn < 1 || inputPlayer < 1 || inputScore.isNegative) return;
    if (inputTurn.isNaN || inputPlayer.isNaN || inputDescribe.isEmpty) return;

    // If inputs correct, calling inputting behavior.
    widget.inputFunction(inputTurn, inputPlayer, inputDescribe, inputScore);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  labelText: '玩家号码', hintText: '输入某位玩家的号码, 例如: 1, 2...'),
              controller: playerInputController,
              keyboardType: TextInputType.number,
            ),
            TextField(
              decoration: InputDecoration(labelText: '天数轮次'),
              controller: turnInputController,
              keyboardType: TextInputType.number,
            ),
            TextField(
              decoration:
                  InputDecoration(labelText: '行为标签', hintText: '例如: 发言逻辑断层'),
              controller: describeInputController,
              keyboardType: TextInputType.text,
            ),
            // TODO: 输入的分数将与其他玩家同样标签的分数值做比较
            TextField(
              decoration: InputDecoration(
                  labelText: '分数', hintText: '例如: 60.5, 99.0...'),
              controller: scoreInputController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            FlatButton(
              onPressed: _submitData,
              child: Text(
                '添加玩家行为评估',
                style: TextStyle(
                  color: Colors.red[400],
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
