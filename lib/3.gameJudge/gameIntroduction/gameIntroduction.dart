import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './configCardGroup/configCardGroup.dart';

class GameIntroduction extends StatelessWidget {
  static const routeName = '/game-introduction';
  final String title;

  GameIntroduction(this.title);

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget createRoomBar = CupertinoNavigationBar(
      middle: Text(title),
    );

    return Scaffold(
      appBar: createRoomBar,
      body: Container(
        alignment: Alignment.center,
        child: ConfigCardGroup(),
      ),
    );
  }
}
