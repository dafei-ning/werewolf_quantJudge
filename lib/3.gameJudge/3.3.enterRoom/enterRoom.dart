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

    var body = TextField(
      obscureText: true,
      decoration: InputDecoration(
        
        border: OutlineInputBorder(),
        labelText: '请输入房间号'
      ),
    );
    return Scaffold(
      appBar: createRoomBar,
      body: Container(
        child: Center(
          child: body,
        ),
      ),
    );
  }
}