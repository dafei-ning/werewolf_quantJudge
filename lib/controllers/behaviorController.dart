import '../models/mappedBehavior.dart';
import '../models/behavior.dart';


class BehaviorController {
  List<MappedBehavior> mapAndAdd(List<MappedBehavior> mappedBehaviors, Behavior behavior) {
    bool noTurnInfo = true;
    int catchTurn = behavior.turn;
    behavior.turn = null;
    for (MappedBehavior eachMappedBehavior in mappedBehaviors) {
      if (eachMappedBehavior.turn == catchTurn) {
        noTurnInfo = false;
        eachMappedBehavior.turnBehaviors.add(behavior);
      }
    }
    if (noTurnInfo) {
      MappedBehavior newMappedBehavior;
      newMappedBehavior.turn = catchTurn;
      newMappedBehavior.turnBehaviors.add(behavior);
      mappedBehaviors.add(newMappedBehavior);
    }
    return mappedBehaviors;
  }
}