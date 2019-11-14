import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Card(child: Text("修改")),
        ],
      ),
    );
  }
}
