import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AddBehaviorButton extends StatelessWidget {
  final Function submitBehavior;
  AddBehaviorButton(this.submitBehavior);
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: submitBehavior,
            color: Theme.of(context).textTheme.button.color,
            child: Text(
              '添加玩家行为',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          )
        : RaisedButton(
            onPressed: submitBehavior,
            color: Theme.of(context).textTheme.button.color,
            child: Text(
              '添加玩家行为',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
  }
}
