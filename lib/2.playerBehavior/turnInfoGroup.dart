import 'package:flutter/material.dart';
import 'package:werewolf_quantjudge/models/behavior.dart';
import '../models/mappedBehavior.dart';
import '2.1.playerRecordAndButton/playerBehaviorRecordCards.dart';
import '2.0.turnTitle.dart';
import '2.2.behaviorInput/behaviorInput.dart';
import '../models/data.dart';
import '../controllers/behaviorController.dart';

class TurnInfoGroup extends StatefulWidget {
  @override
  _TurnInfoGroupState createState() => _TurnInfoGroupState();
}

class _TurnInfoGroupState extends State<TurnInfoGroup> {
  /*  Properties. */
  List<MappedBehavior> mappedBehaviors = SimulateData().mappedBehaviors;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        itemCount: mappedBehaviors.length,
        itemBuilder: (ctx, index) {
          return Container(
            child: Card(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                child: Column(
                  children: <Widget>[
                    // 轮数
                    Container(child: TurnTitle(mappedBehaviors[index].turn)),
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
