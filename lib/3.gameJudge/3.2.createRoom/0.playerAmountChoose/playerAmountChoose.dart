import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:werewolf_quantjudge/data/wolfDatabase.dart';

class PlayerAmountChoose extends StatefulWidget {
  @override
  _PlayerAmountChooseState createState() => _PlayerAmountChooseState();
}

class _PlayerAmountChooseState extends State<PlayerAmountChoose> {
  List<String> playerAmounts = WolfDataBase().playerAmounts;
  int _selectedIndex = 0;
  void _choose() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          child: CupertinoPicker(
            itemExtent: 40,
            onSelectedItemChanged: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            children: new List<Widget>.generate(
              playerAmounts.length,
              (int index) {
                return new Center(
                  child: new Text(playerAmounts[index]),
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var playerAmountDialog = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: 30),
          Text(
            _selectedIndex == 0
                ? '请选择人数'
                : '游戏人数:    ${playerAmounts[_selectedIndex]}',
          ),
          IconButton(
            icon: Icon(Icons.arrow_drop_down),
            onPressed: _choose,
          ),
        ],
      ),
    );

    return playerAmountDialog;
  }
}
