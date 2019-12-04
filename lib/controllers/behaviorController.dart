import '../models/mappedBehavior.dart';
import '../models/behavior.dart';
import '../models/individual.dart';

class BehaviorController {
  // 将每一次记录的玩家Behavior Map成以轮次为主导的玩家behavior集合（mappedBehaviors），
  // 并加入到已有的mappedBehaviors集合中。
  List<MappedBehavior> mapAndAdd(
    List<MappedBehavior> mappedBehaviors,
    Behavior behavior,
  ) {
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
  Map<String, IndividualRecord> groupedBehaviorValues(Map<String, IndividualRecord> individualRecords, List<Behavior> behaviors,) {
    int playerNumber = 0;

    for (Behavior bh in behaviors) {
      if (individualRecords.containsKey(bh.player)) {
        var currentPersonRecord = individualRecords[bh.player];

        // turnRecords
        bool noTurnInfo = true;
        for (TurnRecord eachTR in currentPersonRecord.turnRecords) {
          if (eachTR.turn == bh.turn) {
            eachTR.behaviors.add(bh);
            noTurnInfo = false;
          }
        }
        if (noTurnInfo) {
          TurnRecord newTurnRecord = new TurnRecord(turn: bh.turn, behaviors: [bh]);
          currentPersonRecord.turnRecords.add(newTurnRecord);
        }

        // behaviorRecords

      }
    }

    return List.generate(playerNumber, (index) {});
  }
}
