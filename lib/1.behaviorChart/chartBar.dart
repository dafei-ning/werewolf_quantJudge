/*
 * 把 behavior 的 quantity 引进来，然后根据比例制成bar。
 */

import 'package:flutter/material.dart';
import '../models/individual.dart';

class ChartBar extends StatelessWidget {
  final int player;
  final double maxBehaviorTotal; // 个人最大的行为量的总和，用来做柱状图的100% base。
  final double indBehaviorTotal; // 当前个人的行动量总和，所占柱状图的最高高度
  final List<BehaviorRecord> behaviorRecords; // 当掐按个人行动量的分布

  ChartBar(
    this.player,
    this.maxBehaviorTotal,
    this.indBehaviorTotal,
    this.behaviorRecords,
  );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          child: Column(
            children: <Widget>[
              // behavior quantity
              Container(
                height: constraints.maxHeight * 0.07,
                child: FittedBox(
                  child: Text(
                    '${indBehaviorTotal.toStringAsFixed(0)}',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.03,
              ),
              // 柱状图
              Container(
                height: constraints.maxHeight * 0.7,
                width: 15,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    // Base
                    // Container(
                    //   decoration: BoxDecoration(
                    //     border: Border.all(color: Colors.grey, width: 1.5),
                    //     color: Color.fromRGBO(220, 220, 220, 1),
                    //     borderRadius: BorderRadius.circular(5),
                    //   ),
                    // ),
                    // 用fractionallySizedBox 按比例表现柱状图大小
                    FractionallySizedBox(
                      heightFactor: maxBehaviorTotal == 0
                          ? 0
                          : indBehaviorTotal / maxBehaviorTotal,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1.5),
                          color: Color.fromRGBO(100, 0, 220, 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),

                    // Container(
                    //   height: 10,
                    //   decoration: BoxDecoration(
                    //     border: Border.all(color: Colors.grey, width: 1.5),
                    //     color: Color.fromRGBO(100, 220, 220, 1),
                    //     borderRadius: BorderRadius.circular(5),
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.05,
              ),
              Container(
                height: constraints.maxHeight * 0.07,
                child: FittedBox(
                  child: Text(
                    'P${player}',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
