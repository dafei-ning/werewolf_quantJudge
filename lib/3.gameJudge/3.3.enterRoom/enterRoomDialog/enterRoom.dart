import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:werewolf_quantjudge/3.gameJudge/3.3.enterRoom/enterRoomDialog/passwordDialog.dart';

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
      body: Center(
        child: PasswordDialog(),
      ),
    );
  }
}
