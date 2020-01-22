import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const List<String> colors = ['9', '10', '11', '12', '13', '14', '15', '16'];

class PlayerAmountChoose extends StatefulWidget {
  @override
  _PlayerAmountChooseState createState() => _PlayerAmountChooseState();
}

class _PlayerAmountChooseState extends State<PlayerAmountChoose> {
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
              children: new List<Widget>.generate(colors.length, (int index) {
                return new Center(
                  child: new Text(colors[index]),
                );
              })),
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
          Text(
            _selectedIndex == 0 ? '请选择人数' : '人数:    ${colors[_selectedIndex]}',
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
