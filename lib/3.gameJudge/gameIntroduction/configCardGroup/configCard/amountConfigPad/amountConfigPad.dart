import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../models/gameIntroModel.dart';

class AmountConfigPad extends StatelessWidget {
  final Map<int, CharacterSet> charConfigs;
  AmountConfigPad(this.charConfigs);

  void _playerAmountSuggestion(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("hahah"),
          content: new Text("My alert message"),
          actions: <Widget>[
            FlatButton(
              child: Text("sds"),
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
        children: charConfigs.keys.map((key) {
          return RaisedButton(
            onPressed: () => _playerAmountSuggestion,
            child: Text(
              key.toString(),
            ),
          );
        }).toList(),
      ),
    );
  }
}
