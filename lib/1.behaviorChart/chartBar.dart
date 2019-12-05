/*
 * 把 behavior 的 quantity 引进来，然后根据比例制成bar。
 */

import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final int player;
  final double maxBehaviorTotal; // 个人最大的行为量的总和，用来做柱状图的100% base。
  final double indBehaviorTotal; // 当前个人的行动量总和，所占柱状图的最高高度
  final List<MapEntry> behaviorRecords; // 当掐按个人行动量的分布

  ChartBar(
    this.player,
    this.maxBehaviorTotal,
    this.indBehaviorTotal,
    this.behaviorRecords,
  );

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
              alignment: Alignment.bottomCenter,
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
                // 用fractionallySizedBox 按比例表现柱状图大小
                FractionallySizedBox(
                  heightFactor: 0.2,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.5),
                      color: Color.fromRGBO(100, 0, 220, 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                )
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
