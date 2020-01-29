import 'package:flutter/material.dart';
import '../../../models/gameIntroModel.dart';
import '../../../data/wolfDatabase.dart';

class TeamConfigChoose extends StatefulWidget {
  int playerAmount;
  TeamConfigChoose(this.playerAmount);

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
                //widget.onSelectionChanged(selectedTag);
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
    var gameCFGChips = ac == null ? null : _gameConfigChipList(ac);
    return Container(
        child: gameCFGChips == null
            ? Text('请选择参与游戏的人数')
            : Wrap(children: gameCFGChips));
  }
}
