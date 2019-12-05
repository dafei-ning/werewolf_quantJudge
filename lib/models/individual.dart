import 'package:werewolf_quantjudge/models/behavior.dart';

class IndividualRecord {
  int player;
  double indiTotalBehaviorQuantity;
  double maxTotalBehaviorQuantity;
  List<TurnRecord> turnRecords;
  List<BehaviorRecord> behaviorRecords;

  IndividualRecord({
    this.player,
    this.indiTotalBehaviorQuantity,
    this.maxTotalBehaviorQuantity,
    this.turnRecords,
    this.behaviorRecords,
  });
}

/*
 * 内嵌class
 */
class TurnRecord {
  int turn;
  List<Behavior> behaviors;
  TurnRecord({
    this.turn,
    this.behaviors,
  });
}

class BehaviorRecord {
  String behaviorTag;
  double behaviorQuantity;
  BehaviorRecord(
    this.behaviorTag,
    this.behaviorQuantity,
  );
}
