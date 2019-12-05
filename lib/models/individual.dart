import 'package:werewolf_quantjudge/models/behavior.dart';

class IndividualRecord {
  int player;
  List<TurnRecord> turnRecords;
  List<BehaviorRecord> behaviorRecords;

  IndividualRecord({
    this.player,
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
