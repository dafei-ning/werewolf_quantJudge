import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CheckHistory extends StatelessWidget {
  static const routeName = '/checking-history';
  final String title;
  
  CheckHistory(this.title);

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget createRoomBar = CupertinoNavigationBar(
      middle: Text(title),
    );
    return Scaffold(
      appBar: createRoomBar,
      body: Container(
        child: Center(
          child: Text("this is for checking the history of a player"),
        ),
      ),
    );
  }
}