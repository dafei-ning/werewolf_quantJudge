import 'package:flutter/material.dart';
import '../../../../../models/gameIntroModel.dart';

class AmountConfigPad extends StatelessWidget {
  final Map<int, CharacterSet> charConfigs;
  AmountConfigPad(this.charConfigs);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: charConfigs.keys.map((key) {
        return RaisedButton(child: Text(key.toString()),);
      }).toList(),),
    );
  }
}
