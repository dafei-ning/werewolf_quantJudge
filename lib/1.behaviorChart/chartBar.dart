/*
 * 把 behavior 的 quantity 引进来，然后根据比例制成bar。
 */

import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final int player;
  final double totalBehaviorAmount;
  final Map<String, double> behaviorRecords;

  ChartBar(this.player, this.totalBehaviorAmount, this.behaviorRecords);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text('${100.toStringAsFixed(0)}'),
          SizedBox(
            height: 4,
          ),
          Container(
            height: 60,
            width: 10,
            child: Stack(),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            'Player ${player}',
          ),
        ],
      ),
    );
  }
}
