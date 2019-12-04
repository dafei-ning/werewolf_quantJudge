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
      mappedBehaviors.add(MappedBehavior(
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
      ));
    }
    return mappedBehaviors;
  }

  // 将每一次记录的玩家Behavior
  Map<int, IndividualRecord> groupedBehaviorValues(
    Map<int, IndividualRecord> individualRecords,
    List<Behavior> behaviors,
  ) {
    int playerNumber = 0;

    for (Behavior bh in behaviors) {
      if (!individualRecords.containsKey(bh.player)) {
        individualRecords.addAll({
          bh.player: new IndividualRecord(
            player: bh.player,
            turnRecords: [],
            behaviorRecords: {},
          )
        });
      }
      var currentIndividualRecord = individualRecords[bh.player];

      // turnRecords
      bool noTurnInfo = true;
      for (TurnRecord eachTR in currentIndividualRecord.turnRecords) {
        if (eachTR.turn == bh.turn) {
          eachTR.behaviors.add(bh);
          noTurnInfo = false;
        }
      }
      if (noTurnInfo) {
        currentIndividualRecord.turnRecords.add(TurnRecord(
          turn: bh.turn,
          behaviors: [bh],
        )); //暂时不知道会不会出现问题
      }
      // behaviorRecords
      if (currentIndividualRecord.behaviorRecords.containsKey(bh.describeTab)) {
        currentIndividualRecord.behaviorRecords[bh.describeTab] += bh.quantity;
      } else {
        currentIndividualRecord.behaviorRecords
            .addAll({'bh.describeTab': bh.quantity});
      }
    }

    return List.generate(playerNumber, (index) {});
  }
}
