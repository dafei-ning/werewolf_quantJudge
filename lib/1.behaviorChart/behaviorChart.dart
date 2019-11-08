/*
 * behaviorChart 用来记录玩家行为记录的满值，多则表示行为记录越完整
 * 角色行为记录chart值为唯一引导玩家做判断的内容。
 */
import 'package:flutter/material.dart';

class BehaviorChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey,
      elevation: 2,
      child: Container(
        width: double.infinity,
        height: 200,
        child: Text('这里放柱状图'),
      ),
    );
  }
}
