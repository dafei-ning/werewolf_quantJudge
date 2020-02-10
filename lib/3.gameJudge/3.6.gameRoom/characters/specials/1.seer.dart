import 'package:flutter/material.dart';
import 'package:werewolf_quantjudge/data/simulatedData.dart';
import 'package:werewolf_quantjudge/models/gameIntroModel.dart';

class Seer extends StatefulWidget {
  final Map<int, Character> playerList;
  final Map<int, Character> playerList1 = SimulateData().characterGroup;
  Seer(this.playerList);

  @override
  _SeerState createState() => _SeerState();
}

class _SeerState extends State<Seer> {

  // 预言家功能
  String _checkOnePlayer(int playerNumber) {
    Character pickedPlayer =  widget.playerList1[playerNumber];
    if (pickedPlayer.seerSight == SeerSight.wolfMan) {
      return '狼人';
    }
    return '好人';
  }
  
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
