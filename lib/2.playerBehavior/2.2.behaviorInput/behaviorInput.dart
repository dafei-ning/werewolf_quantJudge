import 'package:flutter/material.dart';
import 'package:werewolf_quantjudge/2.playerBehavior/2.2.behaviorInput/2.2.2.scoreSlider.dart';

class BehaviorInput extends StatefulWidget {
  BehaviorInput(this.inputFunction);
  final Function inputFunction;
  @override
  _BehaviorInputState createState() => _BehaviorInputState();
}

class _BehaviorInputState extends State<BehaviorInput> {
  final turnInputController = TextEditingController();
  final describeInputController = TextEditingController();
  final playerInputController = TextEditingController();
  //final scoreInputController = TextEditingController();

  double _sliderScore = 20.5;

  void _submitData() {
    final inputTurn = int.parse(turnInputController.text);
    final inputPlayer = int.parse(playerInputController.text);
    final inputDescribe = describeInputController.text;
    final inputScore = double.parse(_sliderScore.toStringAsFixed(2));

    // Error protection.
    if (inputTurn < 1 || inputPlayer < 1) return;
    if (inputTurn.isNaN || inputPlayer.isNaN || inputDescribe.isEmpty) return;

    // If inputs correct, calling inputting behavior.
    widget.inputFunction(inputTurn, inputPlayer, inputDescribe, inputScore);
    Navigator.of(context).pop();
  }

  void _describeTagPicker() {
    //showDatePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  // Container(child: Text('aaa')),
                  // Container(child: Text('bbb')),
                ],
              ),
            ),

            // 玩家号码
            Container(
              child: TextField(
                decoration: InputDecoration(
                    labelText: '玩家号码', hintText: '输入某位玩家的号码, 例如: 1, 2...'),
                controller: playerInputController,
                keyboardType: TextInputType.number,
              ),
            ),
            // 天数轮次
            Container(
              child: TextField(
                decoration: InputDecoration(labelText: '天数轮次'),
                controller: turnInputController,
                keyboardType: TextInputType.number,
              ),
            ),
            // 行为标签
            Container(
              child: TextField(
                decoration:
                    InputDecoration(labelText: '行为标签', hintText: '例如: 发言逻辑断层'),
                controller: describeInputController,
                keyboardType: TextInputType.text,
              ),
            ),

            // 分数slider
            Container(child: ScoreSlider(_sliderScore)),

            // 行为分数
            // Container(
            //   child: TextField(
            //     decoration: InputDecoration(
            //         labelText: '分数', hintText: '例如: 60.5, 99.0...'),
            //     controller: scoreInputController,
            //     keyboardType: TextInputType.numberWithOptions(decimal: true),
            //   ),
            // ),
            // 行为标签新
            Container(
              child: Row(
                children: <Widget>[
                  Text('请选择行为标签!'),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      '选择标签',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            // 提交按钮
            Container(
              child: RaisedButton(
                onPressed: _submitData,
                color: Theme.of(context).textTheme.button.color,
                child: Text(
                  '添加玩家行为评估',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
