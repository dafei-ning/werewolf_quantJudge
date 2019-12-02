import '../models/mappedBehavior.dart';
import '../models/behavior.dart';
import '../models/individual.dart';

class BehaviorController {
  
  // 将每一次记录的玩家Behavior Map成以轮次为主导的玩家behavior集合（mappedBehaviors），
  // 并加入到已有的mappedBehaviors集合中。
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

  // 将每一次记录的玩家Behavior
  List<IndividualRecord> groupedBehaviorValues(List<Behavior> behaviors) {
    int playerNumber = 0;

    return List.generate(playerNumber, generator);
  }


}
