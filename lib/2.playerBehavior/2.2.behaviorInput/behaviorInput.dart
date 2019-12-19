import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:werewolf_quantjudge/2.playerBehavior/2.2.behaviorInput/2.2.1.player&turn.dart';
import 'package:werewolf_quantjudge/2.playerBehavior/2.2.behaviorInput/2.2.2.describeTag/describeTagPicker.dart';
import 'package:werewolf_quantjudge/2.playerBehavior/2.2.behaviorInput/2.2.3.scoreSlider.dart';
import 'package:werewolf_quantjudge/2.playerBehavior/2.2.behaviorInput/2.2.4.addBehaviorButton.dart';
import '../../models/wolfDatabase.dart';

class BehaviorInput extends StatefulWidget {
  BehaviorInput(this.inputFunction);
  final Function inputFunction;
  @override
  _BehaviorInputState createState() => _BehaviorInputState();
}

class _BehaviorInputState extends State<BehaviorInput> {
  final _turnInput = TextEditingController();
  final _playerInput = TextEditingController();
  List<String> describeTagList = WolfDataBase().describeTagList;
  String _describeTag; // describeTag
  double _sliderScore = 0;

  void _submitBehavior() {
    final _inputTurn = int.parse(_turnInput.text);
    final _inputPlayer = int.parse(_playerInput.text);
    final _inputScore = double.parse(_sliderScore.toStringAsFixed(2));
    if (_inputTurn < 0 || _inputPlayer < 1) return;
    if (_inputTurn.isNaN || _inputPlayer.isNaN || _describeTag == null) {
      return;
    } // call inputbehavior if inputs correct
    widget.inputFunction(
      _inputTurn,
      _inputPlayer,
      _inputScore,
      _describeTag,
    );
    Navigator.of(context).pop();
  }

  /*
   * Private functions for updating player's behaviors
   */
  void _updateSliderScore(double updatedslideScore) {
    setState(() {
      _sliderScore = updatedslideScore;
    });
  }

  void _describeTagPicker(pickedTag) {
    setState(() {
      _describeTag = pickedTag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 10,
        child: Container(
          padding: EdgeInsets.only(
            top: 8,
            left: 8,
            right: 8,
            bottom: MediaQuery.of(context).viewInsets.bottom + 200,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              // Player & Turn
              Container(
                child: PlayerAndTurn(_playerInput, _turnInput),
              ),
              // DescribeTag
              Container(
                child: DescribeTagPicker(describeTagList, _describeTagPicker),
              ),
              // 分数slider
              Container(
                child: ScoreSlider(_updateSliderScore),
              ),
              SizedBox(
                height: 10,
              ),
              // 提交按钮
              Container(
                child: AddBehaviorButton(_submitBehavior),
              )
            ],
          ),
        ),
      ),
    );
  }
}
