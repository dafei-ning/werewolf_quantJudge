import 'package:werewolf_quantjudge/models/behavior.dart';

class IndividualRecord {
  int player;
  List<TurnRecord> turnRecords;
  Map<String, double> behaviorRecords;

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