import 'package:flutter/material.dart';
import 'package:werewolf_quantjudge/models/gameIntroModel.dart';
import './specialIntro.dart';
import './amountConfigPad/amountConfigPad.dart';

class ConfigCard extends StatelessWidget {
  final String gameConfigName;
  final Map<int, CharacterSet> charConfigs;
  final List<Object> specialChars;
  ConfigCard(
    this.gameConfigName,
    this.charConfigs,
    this.specialChars,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            child: SpecialIntro(specialChars),
          ),
          Container(
            child: AmountConfigPad(gameConfigName, charConfigs),
          ),
        ],
      ),
    );
  }
}
