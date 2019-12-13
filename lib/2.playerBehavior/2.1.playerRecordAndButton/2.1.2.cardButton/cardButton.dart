import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  // final Function deleteFunction;
  // CardButton(this.deleteFunction);
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
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
