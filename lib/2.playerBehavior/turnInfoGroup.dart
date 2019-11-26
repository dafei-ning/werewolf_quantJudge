import 'package:flutter/material.dart';
import '../models/mappedBehavior.dart';
import '2.1.playerRecordAndButton/playerBehaviorRecordCards.dart';
import '2.0.turnTitle.dart';

class TurnInfoGroup extends StatelessWidget {
  final List<MappedBehavior> mappedBehaviors;
  TurnInfoGroup(this.mappedBehaviors);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: mappedBehaviors.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  '还没有添加用户行为',
                  style: Theme.of(context).textTheme.title,
                )
              ],
            )
          : ListView.builder(
              itemCount: mappedBehaviors.length,
              itemBuilder: (ctx, index) {
                return Container(
                  child: Card(
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      child: Column(
                        children: <Widget>[
                          // 轮数
                          Container(
                              child: TurnTitle(mappedBehaviors[index].turn)),
                          // 每一轮的用户行为(组)
                          Container(
                              child: PlayerBehaviorRecordCardGroup(
                                  mappedBehaviors[index].turnBehaviors)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
