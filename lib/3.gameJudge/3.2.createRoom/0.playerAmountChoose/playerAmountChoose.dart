import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayerAmountChoose extends StatefulWidget {
  @override
  _PlayerAmountChooseState createState() => _PlayerAmountChooseState();
}

class _PlayerAmountChooseState extends State<PlayerAmountChoose> {
  @override
  Widget build(BuildContext context) {

    String _selectedAmount;

    Future<String> _choosePlayerAmount() {
      return showCupertinoModalPopup(
          context: context,
          builder: (ctx) {
            return SizedBox(
              height: 300,
              child: CupertinoPicker(
                looping: true,
                itemExtent: 40,
                onSelectedItemChanged: (value) {
                  setState(() {
                    _selectedAmount = value.toString();
                    print(' print selected: ${_selectedAmount}');
                  });
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
      child: Text(
        _selectedAmount == null ? '选择本局人数' : '人数: ${_selectedAmount}' 
      ),
    );
  }
}
