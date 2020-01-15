import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CreateRoom extends StatelessWidget {
  static const routeName = '/create-room';

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget createRoomBar = CupertinoNavigationBar(
      middle: Text("创建狼人杀房间"),
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
