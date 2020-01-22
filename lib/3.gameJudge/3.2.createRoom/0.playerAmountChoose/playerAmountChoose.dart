import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const List<String> colors = const <String>[
  'Red',
  'Yellow',
  'Amber',
  'Blue',
  'Black',
  'Pink',
  'Purple',
  'White',
  'Grey',
  'Green',
];

class PlayerAmountChoose extends StatefulWidget {
  @override
  _PlayerAmountChooseState createState() => _PlayerAmountChooseState();
}

class _PlayerAmountChooseState extends State<PlayerAmountChoose> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    var playerAmountDialog = Container(
      child: Row(
        children: <Widget>[
          CupertinoButton(
              child: Text("Select Color :"),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 200.0,
                        child: CupertinoPicker(
                            itemExtent: 32.0,
                            onSelectedItemChanged: (int index) {
                              setState(() {
                                _selectedIndex = index;
                              });
                            },
                            children: new List<Widget>.generate(colors.length,
                                (int index) {
                              return new Center(
                                child: new Text(colors[index]),
                              );
                            })),
                      );
                    });
              }),
          Text(
            colors[_selectedIndex],
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );

    return playerAmountDialog;
  }
}
