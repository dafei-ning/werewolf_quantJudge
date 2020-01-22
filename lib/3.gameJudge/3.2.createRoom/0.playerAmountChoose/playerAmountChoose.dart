import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayerAmountChoose extends StatefulWidget {
  @override
  _PlayerAmountChooseState createState() => _PlayerAmountChooseState();
}

class _PlayerAmountChooseState extends State<PlayerAmountChoose> {
  @override
  Widget build(BuildContext context) {
    int selectItem = 1;

    Future<String> _choosePlayerAmount() {
      return showCupertinoModalPopup(
          context: context,
          builder: (ctx) {
            return SizedBox(
              height: 300,
              child: CupertinoPicker(
                itemExtent: 40,
                onSelectedItemChanged: (int index) {
                  selectItem = index;
                },
                children: <Widget>[
                  Text("1"),
                  Text("2"),
                  Text("3"),
                  Text("4"),
                ],
              ),
            );
          });
    }

    return RaisedButton(
      onPressed: _choosePlayerAmount,
      child: Text('sss ${selectItem}'),
    );
  }
}
