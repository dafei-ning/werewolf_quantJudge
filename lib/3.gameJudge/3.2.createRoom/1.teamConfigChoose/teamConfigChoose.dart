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
  

  @override
  Widget build(BuildContext context) {
    AmountConfiguration ac = widget.playerAmount == 0? null : acs.singleWhere((ac) => ac.playerAmount == widget.playerAmount);

    var textss = ac == null? '第一行，选人数' : '第一行，版型 ${ac.playerAmount.toString()}';

    return Container(
      child: Text(textss),
    );
  }
}
