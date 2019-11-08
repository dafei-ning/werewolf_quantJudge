import 'package:flutter/material.dart';

class TurnInfo extends StatelessWidget {

  final int id;
  final String turn; // to be changed into turnselector object.

  /*
   * Constructor
   */
  TurnInfo(this.id, this.turn);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        // 2.1.1.1 角色号码
        Container(child: Text(id.toString())),
        // 2.1.1.2 角色轮数
        Container(child: Card(child: Text(turn))),
      ],
    );
  }
}
