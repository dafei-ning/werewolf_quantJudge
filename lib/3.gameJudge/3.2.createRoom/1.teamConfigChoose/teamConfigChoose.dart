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
  List<AmountConfiguration> acs = WolfDataBase().amountConfigurations;

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Text('第一行，版型 ${widget.playerAmount.toString()}'),
    );
  }
}
