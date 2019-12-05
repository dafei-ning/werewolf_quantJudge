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
            height: 105,
            width: 13,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.5),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.5),
                    color: Color.fromRGBO(100, 220, 220, 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            'P${player}',
          ),
        ],
      ),
    );
  }
}
