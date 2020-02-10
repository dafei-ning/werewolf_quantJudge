import 'package:flutter/material.dart';
import 'package:werewolf_quantjudge/data/simulatedData.dart';
import 'package:werewolf_quantjudge/models/gameIntroModel.dart';

class Witch extends StatelessWidget {
  final Map<int, Character> playerList;
  final Map<int, Character> playerList1 = SimulateData().characterGroup;
  Witch(this.playerList);

  

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}