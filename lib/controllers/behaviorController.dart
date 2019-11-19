import '../models/mappedBehavior.dart';
import '../models/behavior.dart';

class BehaviorController {
  List<MappedBehavior> mapAndAdd(
      List<MappedBehavior> mappedBehaviors, Behavior behavior) {
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
      MappedBehavior newMappedBehavior = new MappedBehavior(
        turn: catchTurn,
        turnBehaviors: [
          Behavior(
            id: 888,
            player: behavior.player,
            describeTab: behavior.describeTab,
            quantity: behavior.quantity,
            date: DateTime.now(),
          ),
        ],
      );
      mappedBehaviors.add(newMappedBehavior);
    }
    return mappedBehaviors;
  }
}
