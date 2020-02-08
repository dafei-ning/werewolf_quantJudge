import 'package:flutter/material.dart';
import 'package:werewolf_quantjudge/data/simulatedData.dart';
import 'package:werewolf_quantjudge/models/gameIntroModel.dart';

class Seer extends StatefulWidget {
  final Map<int, Character> playerList;
  final Map<int, Character> simulatedPlayerList = SimulateData().characterGroup;
  Seer(this.playerList);

  @override
  _SeerState createState() => _SeerState();
}

class _SeerState extends State<Seer> {
  void _checkOnePlayer() {

  }
  
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
