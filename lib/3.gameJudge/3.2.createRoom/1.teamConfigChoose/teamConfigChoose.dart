import 'package:flutter/material.dart';
import '../../../models/gameIntroModel.dart';
import '../../../data/wolfDatabase.dart';

class TeamConfigChoose extends StatefulWidget {
  int playerAmount;
  final Function setGamePattern;
  TeamConfigChoose(this.playerAmount, this.setGamePattern);

  @override
  _TeamConfigChooseState createState() => _TeamConfigChooseState();
}

class _TeamConfigChooseState extends State<TeamConfigChoose> {
  static List<AmountConfiguration> acs = WolfDataBase().amountConfigurations;
  static Map<GamePattern, String> patternMap = WolfDataBase().patternMap;

  String selectedGcfgName;
  List<Widget> _gameConfigChipList(AmountConfiguration ac) {
    List<Widget> resultList = [];
    ac.charConfigs.forEach((k, v) {
      String cfgName = patternMap[k];
      var gameConfigChip = Container(
        margin: EdgeInsets.all(5),
        child: ChoiceChip(
          label: Text(cfgName),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          selected: selectedGcfgName == cfgName,
          onSelected: (selected) {
            setState(() {
              selectedGcfgName = cfgName;
              widget.setGamePattern(k);
            });
          },
        ),
      );
      resultList.add(gameConfigChip);
    });
    return resultList;
  }

  @override
  Widget build(BuildContext context) {
    AmountConfiguration ac = widget.playerAmount == 0
        ? null
        : acs.singleWhere((ac) => ac.playerAmount == widget.playerAmount);
    var gameCFGChips = ac == null
        ? Text('请选择参与游戏的人数')
        : Wrap(children: _gameConfigChipList(ac));
    var teamConfigChoosePad = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20),
        Container(
          margin: EdgeInsets.only(left: 6),
          child: Text(
            '选择板子配置',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        gameCFGChips,
      ],
    );
    return Container(
      height: 200,
      alignment: Alignment.centerLeft,
      child: teamConfigChoosePad,
    );
  }
}
