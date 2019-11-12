import 'package:flutter/material.dart';

class TurnInfo extends StatelessWidget {
  final int id;
  final int turn; // to be changed into turnselector object.

  /*
   * Constructor
   */
  TurnInfo(this.id, this.turn);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        // 2.1.1.1 behavior id
        Container(
          child: Text(
            id.toString(),
          ),
        ),
        // 2.1.1.2 轮数
        Container(
          child: Card(
            child: Text(
              "第" + turn.toString() + "轮",
              style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
            ),
          ),
        ),
      ],
    );
  }
}
