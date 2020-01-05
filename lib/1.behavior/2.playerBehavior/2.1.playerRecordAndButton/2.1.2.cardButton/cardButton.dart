import 'package:flutter/material.dart';
import 'package:werewolf_quantjudge/models/behavior.dart';

class CardButton extends StatelessWidget {
  final Function deleteFunction;
  final Behavior behavior;
  CardButton(this.deleteFunction, this.behavior);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Card(
          child: IconButton(
            icon: Icon(Icons.delete),
            color: Theme.of(context).errorColor,
            iconSize: 18,
            tooltip: '删除此条记录',
            padding: EdgeInsets.all(10),
            onPressed: () {
              deleteFunction(behavior);
            }
          ),
        ),
      ],
    );
  }
}
