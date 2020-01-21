import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:werewolf_quantjudge/3.gameJudge/3.2.createRoom/1.choiceChipGroup.dart';
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

    var choiceCard = Card(
      
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('15人局'),
          Container(
              child: Column(children: <Widget>[
            Text('第一行，版型'),
            Text('第二行，配置'),
          ])),
        ],
      ),
    );

    var choiceSheetList = ListView.builder(
      itemCount: configs.length,
      itemBuilder: (ctx, index) {
        // 所需要的var，每个card 一个标题，人数个配置按钮。
        var gameConfigName = configs[index].gameConfigName;
        var charConfigs = configs[index].charConfigs;
        var specialChars = configs[index].specialIntroPool;
        // 每个角色配置的选择框
        var choiceSheet = Container(
          child: Card(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(gameConfigName),
                ),
                Container(
                  child: ChoiceChipGroup(gameConfigName, charConfigs),
                ),
              ],
            ),
          ),
        );
        return choiceSheet;
      },
    );

    return Scaffold(
      appBar: createRoomBar,
      body: choiceCard,
    );
  }
}
