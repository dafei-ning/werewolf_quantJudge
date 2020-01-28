import 'package:flutter/material.dart';
import '../../../models/gameIntroModel.dart';
import '../../../data/wolfDatabase.dart';

class TeamConfigChoose extends StatefulWidget {
  final int playerAmount;
  TeamConfigChoose(this.playerAmount);

  @override
  _TeamConfigChooseState createState() => _TeamConfigChooseState();
}

class _TeamConfigChooseState extends State<TeamConfigChoose> {
  List<AmountConfiguration> acs = WolfDataBase().amountConfigurations;

  // AmountConfiguration _find(int a, List<AmountConfiguration> acs) {
  //   print('ssss ${widget.playerAmount}');
  //   for (AmountConfiguration ac in acs) {
  //     if (a == ac.playerAmount) {
  //       return ac;
  //     }
  //     return null;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // AmountConfiguration aconfigs = _find(widget.playerAmount, acs);
    // AmountConfiguration aconfigs =
    //     acs.singleWhere((ac) => ac.playerAmount == widget.playerAmount);

    return Container(
      child: Text('第一行，版型 ${widget.playerAmount}'),
    );
  }
}
