import 'package:flutter/material.dart';
import '../../../models/gameIntroModel.dart';
import '../../../data/wolfDatabase.dart';

class TeamConfigChoose extends StatelessWidget {
  final int playerAmount;
  final List<AmountConfiguration> amountConfigurations =
      WolfDataBase().amountConfigurations;
  TeamConfigChoose(this.playerAmount);

  @override
  Widget build(BuildContext context) {
    AmountConfiguration aconfigs = amountConfigurations
        .singleWhere((ac) => ac.playerAmount == playerAmount);

    return Container(
      child: Text('第一行，版型'),
    );
  }
}
