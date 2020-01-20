import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../models/gameIntroModel.dart';

class AmountConfigPad extends StatefulWidget {
  final Map<int, CharacterSet> charConfigs;
  final String gameConfigName;
  AmountConfigPad(this.gameConfigName, this.charConfigs);

  @override
  _AmountConfigPadState createState() => _AmountConfigPadState();
}

class _AmountConfigPadState extends State<AmountConfigPad> {
  void _playerAmountSuggestion(int playerAmount) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('「${widget.gameConfigName}」${playerAmount}人局配置'),
          content: Text("My alert messageMy alert messageMy alert messageMy alert messageMy alert messageMy My alert messageMy alert messageMy alert messageMy alert messageMy alert messageMy My alert messageMy alert messageMy alert messageMy alert messageMy alert messageMy alert messageMy alert messageMy alert message"),
          actions: <Widget>[
            RaisedButton(
              child: Text('关闭'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: widget.charConfigs.keys.map((key) {
          return RaisedButton(
            onPressed: () => _playerAmountSuggestion(key),
            child: Text(
              key.toString(),
            ),
          );
        }).toList(),
      ),
    );
  }
}
