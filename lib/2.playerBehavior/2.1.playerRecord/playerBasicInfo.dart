import 'package:flutter/material.dart';

class PlayerBasicInfo extends StatelessWidget {

  final String id;
  final String turn; // to be changed into turnselector object.

  /*
   * Constructor
   */
  PlayerBasicInfo(this.id, this.turn);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        // 2.1.1.1 角色号码
        Container(child: Text(id)),
        // 2.1.1.2 角色轮数
        Container(child: Card(child: Text(turn))),
      ],
    );
  }
}
