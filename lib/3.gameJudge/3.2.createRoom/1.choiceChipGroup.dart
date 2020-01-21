import 'package:flutter/material.dart';
import '../../models/gameIntroModel.dart';
import '1.1.choiceConfigChip.dart';

class ChoiceChipGroup extends StatelessWidget {
  final String gameConfigName;
  final Map<int, CharacterSet> charConfigs;

  ChoiceChipGroup(
    this.gameConfigName,
    this.charConfigs,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      // 一竖排的chips
      child: Column(
        children: charConfigs.entries.map((entry) {
          return ChoiceConfigChip(entry);
        }).toList(),
      ),
    );
  }
}
