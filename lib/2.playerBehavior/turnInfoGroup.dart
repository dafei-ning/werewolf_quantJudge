import 'package:flutter/material.dart';
import '../models/mappedBehavior.dart';
import '2.1.playerRecordAndButton/playerBehaviorRecordCards.dart';
import '2.0.turnTitle.dart';

class TurnInfoGroup extends StatelessWidget {
  final List<MappedBehavior> mappedBehaviors;
  final Function deleteBehaviorFunction;

  TurnInfoGroup(
    this.mappedBehaviors,
    this.deleteBehaviorFunction,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: MediaQuery.of(context).size.height * 0.6,
      child: mappedBehaviors.isEmpty
          ? Column(
              children: <Widget>[
                Text('还没有添加用户行为哈哈', style: Theme.of(context).textTheme.subhead),
                SizedBox(
                  height: 40,
                ),
                Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            )
          : ListView.builder(
              itemCount: mappedBehaviors.length,
              itemBuilder: (ctx, index) {
                return Container(
                  child: Card(
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 8,
                      ),
                      child: Column(
                        children: <Widget>[
                          // 轮数
                          Container(
                            child: TurnTitle(mappedBehaviors[index].turn),
                          ),
                          // 每一轮的用户行为(组)
                          Container(
                            child: PlayerBehaviorRecordCardGroup(
                              mappedBehaviors[index].turnBehaviors,
                              deleteBehaviorFunction,
                            ),
                          ),
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
