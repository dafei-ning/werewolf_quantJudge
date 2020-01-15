import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class EnterRoom extends StatelessWidget {
  static const routeName = '/enter-room';
  final String title;
  
  EnterRoom(this.title);

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget createRoomBar = CupertinoNavigationBar(
      middle: Text(title),
    );
    return Scaffold(
      appBar: createRoomBar,
      body: Container(
        child: Center(
          child: Text("this is for enter a room"),
        ),
      ),
    );
  }
}