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

  // 将每一次记录的玩家Behavior map成以玩家号码为主导的behavior集合
  // 并将结果加入到 turnRecords 和 behaviorRecords 中。
  List<IndividualRecord> groupedBehaviorValues(
      List<IndividualRecord> individualRecords, Behavior bh) {
    bool noPlayerRecord = true;
    var currentIndividualRecord;
    for (IndividualRecord ir in individualRecords) {
      if (ir.player == bh.player) {
        currentIndividualRecord = ir;
        noPlayerRecord = false;
      }
    }
    if (noPlayerRecord) {
      var newIndividualRecord = IndividualRecord(
        player: bh.player,
        indBehaviorTotal: 0,
        maxBehaviorTotal: 0,
        turnRecords: [],
        behaviorRecords: [],
      );
      currentIndividualRecord = newIndividualRecord;
      individualRecords.add(newIndividualRecord);
    }
    // turnRecords
    bool noTurnInfo = true;
    for (TurnRecord eachTR in currentIndividualRecord.turnRecords) {
      if (eachTR.turn == bh.turn) {
        eachTR.behaviors.add(bh);
        noTurnInfo = false;
      }
    }
    if (noTurnInfo) {
      currentIndividualRecord.turnRecords
          .add(TurnRecord(turn: bh.turn, behaviors: [bh])); //暂时不知道会不会出现问题
    }
    // behaviorRecords
    bool noBhTag = true;
    for (BehaviorRecord bhR in currentIndividualRecord.behaviorRecords) {
      if (bhR.behaviorTag == bh.describeTab) {
        bhR.behaviorQuantity += bh.quantity;
        noBhTag = false;
      }
    }
    if (noBhTag) {
      currentIndividualRecord.behaviorRecords
          .add(BehaviorRecord(behaviorTag: bh.describeTab, behaviorQuantity: bh.quantity));
    }
    currentIndividualRecord.indBehaviorTotal += bh.quantity;
    // maxTotalBehaviorQuantity
    double curMaxBehaviorTotal = 0;
    for (IndividualRecord ir in individualRecords) {
      curMaxBehaviorTotal =
          ir.indBehaviorTotal >= curMaxBehaviorTotal
              ? ir.indBehaviorTotal
              : curMaxBehaviorTotal;
    }
    for (IndividualRecord ir in individualRecords) {
      ir.maxBehaviorTotal = curMaxBehaviorTotal;
    }
    return individualRecords;
  }
}
