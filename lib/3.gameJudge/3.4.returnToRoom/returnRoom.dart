import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ReturnRoom extends StatelessWidget {
  static const routeName = '/return-to-room';
  final String title;
  
  ReturnRoom(this.title);

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget createRoomBar = CupertinoNavigationBar(
      middle: Text(title),
    );
    return Scaffold(
      appBar: createRoomBar,
      body: Container(
        child: Center(
          child: Text("this is for return a room"),
        ),
      ),
    );
  }
}