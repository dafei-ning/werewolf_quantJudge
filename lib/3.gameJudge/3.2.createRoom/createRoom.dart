import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CreateRoom extends StatelessWidget {
  static const routeName = '/create-room';
  final String title;
  
  CreateRoom(this.title);

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget createRoomBar = CupertinoNavigationBar(
      middle: Text(title),
    );
    return Scaffold(
      appBar: createRoomBar,
      body: Container(
        child: Center(
          child: Text("this is for create a room"),
        ),
      ),
    );
  }
}
