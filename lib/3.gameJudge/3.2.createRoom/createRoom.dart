import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../data/wolfDatabase.dart';
import '../../models/gameIntroModel.dart';

class CreateRoom extends StatelessWidget {
  static const routeName = '/create-room';
  final String title;
  final List<CharacterConfiguration> configs =
      WolfDataBase().characterConfigurations;

  CreateRoom(this.title);

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget createRoomBar = CupertinoNavigationBar(
      middle: Text(title),
    );

    var gameConfigInteractionList = ListView.builder(
      itemCount: configs.length,
      itemBuilder: (ctx, index) {
        // 所需要的var，每个card 一个标题，人数个配置按钮。
        var gameConfigName = configs[index].gameConfigName;
        var charConfigs = configs[index].charConfigs;
        var specialChars = configs[index].specialIntroPool;
        // 每个角色配置的选择框
        var choiceSheet = Container(
          child: Card(),
        );
        return choiceSheet;
      },
    );
    
    return Scaffold(
      appBar: createRoomBar,
      body: gameConfigInteractionList,
    );
  }
}
