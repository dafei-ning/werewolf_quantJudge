import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:werewolf_quantjudge/2.playerBehavior/2.2.behaviorInput/2.2.1.player&turn.dart';
import 'package:werewolf_quantjudge/2.playerBehavior/2.2.behaviorInput/2.2.3.scoreSlider.dart';

class BehaviorInput extends StatefulWidget {
  BehaviorInput(this.inputFunction);

  final Function inputFunction;
  @override
  _BehaviorInputState createState() => _BehaviorInputState();
}

class _BehaviorInputState extends State<BehaviorInput> {
  final _turnInputController = TextEditingController();
  final _playerInputController = TextEditingController();

  int _player;
  int _turn;
  DateTime _pickedDate; // describeTag
  double _sliderScore = 0;

  void _submitData() {
    final _inputTurn = int.parse(_turnInputController.text);
    final _inputPlayer = int.parse(_playerInputController.text);
    final _inputScore = double.parse(_sliderScore.toStringAsFixed(2));
    if (_inputTurn < 1 || _inputPlayer < 1) return;
    if (_inputTurn.isNaN || _inputPlayer.isNaN || _pickedDate == null) {
      return;
    }
    // If inputs correct, calling inputting behavior.
    widget.inputFunction(
      _inputTurn,
      _inputPlayer,
      _inputScore,
      _pickedDate,
    );
    Navigator.of(context).pop();
  }

  /*
   * Private functions for updating player's behaviors
   */

  void _updatePlayerAndTurn(int player, int turn) {
    setState(() {
      _player = player;
      _turn = turn;
    });
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
      }
      setState(() {
        _pickedDate = pickedTag;
      });
    });
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
            // 玩家号码 & 轮数
            //Container(child: PlayerAndTurn()),

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
            
            // 新行为标签
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _pickedDate == null
                          ? '请选择行为标签!'
                          : '标签: ${DateFormat.yMd().format(_pickedDate)}',
                    ),
                  ),
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

            // 分数slider
            Container(child: ScoreSlider(_sliderScore, _updateSliderScore)),

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
