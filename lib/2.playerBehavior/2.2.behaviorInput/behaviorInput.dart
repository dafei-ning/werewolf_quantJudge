import 'package:flutter/material.dart';
import 'package:werewolf_quantjudge/2.playerBehavior/2.2.behaviorInput/2.2.2.scoreSlider.dart';

class BehaviorInput extends StatefulWidget {
  BehaviorInput(this.inputFunction);

  final Function inputFunction;
  @override
  _BehaviorInputState createState() => _BehaviorInputState();
}

class _BehaviorInputState extends State<BehaviorInput> {
  final _turnInputController = TextEditingController();
  final _describeInputController = TextEditingController();
  final _playerInputController = TextEditingController();
  DateTime _pickedDate;

  double _sliderScore = 0;

  void _submitData() {
    final _inputTurn = int.parse(_turnInputController.text);
    final _inputPlayer = int.parse(_playerInputController.text);
    final _inputDescribe = _describeInputController.text;
    final _inputScore = double.parse(_sliderScore.toStringAsFixed(2));

    // Error protection.
    if (_inputTurn < 1 || _inputPlayer < 1) return;
    if (_inputTurn.isNaN || _inputPlayer.isNaN || _inputDescribe.isEmpty) return;

    // If inputs correct, calling inputting behavior.
    widget.inputFunction(_inputTurn, _inputPlayer, _inputDescribe, _inputScore);
    Navigator.of(context).pop();
  }

  void _updateSliderScore(double updatedslideScore) {
    setState(() {
      _sliderScore = updatedslideScore;
    });
  }

  void _describeTagPicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedTag) {
      if (pickedTag == null) {
        return;
      } else {
        _pickedDate = pickedTag;
      }

    });
    //showTimePicker(context: context, initialTime: TimeOfDay.now(),);
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
                controller: _playerInputController,
                keyboardType: TextInputType.number,
              ),
            ),
            // 天数轮次
            Container(
              child: TextField(
                decoration: InputDecoration(labelText: '天数轮次'),
                controller: _turnInputController,
                keyboardType: TextInputType.number,
              ),
            ),
            // 行为标签
            Container(
              child: TextField(
                decoration:
                    InputDecoration(labelText: '行为标签', hintText: '例如: 发言逻辑断层'),
                controller: _describeInputController,
                keyboardType: TextInputType.text,
              ),
            ),

            // 分数slider
            Container(child: ScoreSlider(_sliderScore, _updateSliderScore)),

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
                  Text(_pickedDate == null? '请选择行为标签!' : _pickedDate.toString()),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      '选择标签',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: _describeTagPicker,
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
                  '添加玩家行为',
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
