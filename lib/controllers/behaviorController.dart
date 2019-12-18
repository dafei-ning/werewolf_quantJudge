import '../models/mappedBehavior.dart';
import '../models/behavior.dart';
import '../models/individual.dart';

class BehaviorController {
  /*
   * 将每一次记录的玩家Behavior Map成以轮次为主导的玩家behavior集合（mappedBehaviors），
   * 并加入到已有的mappedBehaviors集合中。
   */
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
        eachMappedBehavior.turnBehaviors.sort((bh1, bh2) {
          return bh1.player.compareTo(bh2.player);
        });
      }
    }
    if (noTurnInfo) {
      mappedBehaviors.add(MappedBehavior(
        turn: catchTurn,
        turnBehaviors: [behavior],
      ));
    }
    mappedBehaviors.sort((mb2, mb1) {
      return mb1.turn.compareTo(mb2.turn);
    });
    return mappedBehaviors;
  }

  // List<MappedBehavior> mapBehaviorsToMBHs(List<MappedBehavior> behaviors) {
  //   bool noTurnInfo = true;
  //   int catchTurn = behavior.turn;
  //   behavior.turn = null;
  //   for (MappedBehavior eachMappedBehavior in mappedBehaviors) {
  //     if (eachMappedBehavior.turn == catchTurn) {
  //       noTurnInfo = false;
  //       eachMappedBehavior.turnBehaviors.add(behavior);
  //       eachMappedBehavior.turnBehaviors.sort((bh1, bh2) {
  //         return bh1.player.compareTo(bh2.player);
  //       });
  //     }
  //   }
  //   if (noTurnInfo) {
  //     mappedBehaviors.add(MappedBehavior(
  //       turn: catchTurn,
  //       turnBehaviors: [behavior],
  //     ));
  //   }
  //   mappedBehaviors.sort((mb2, mb1) {
  //     return mb1.turn.compareTo(mb2.turn);
  //   });
  //   return mappedBehaviors;
  // }

  /* 
   * 将每一次记录的玩家Behavior map成以玩家号码为主导的behavior集合
   * 并将结果加入到 turnRecords 和 behaviorRecords 中。
   */
  List<IndividualRecord> groupedBehaviorValues(
    List<IndividualRecord> individualRecords,
    Behavior bh,
  ) {
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
      currentIndividualRecord.behaviorRecords.add(BehaviorRecord(
          behaviorTag: bh.describeTab, behaviorQuantity: bh.quantity));
    }
    currentIndividualRecord.indBehaviorTotal += bh.quantity;
    // maxTotalBehaviorQuantity
    double curMaxBehaviorTotal = 0;
    for (IndividualRecord ir in individualRecords) {
      curMaxBehaviorTotal = ir.indBehaviorTotal >= curMaxBehaviorTotal
          ? ir.indBehaviorTotal
          : curMaxBehaviorTotal;
    }
    for (IndividualRecord ir in individualRecords) {
      ir.maxBehaviorTotal = curMaxBehaviorTotal;
    }
    individualRecords.sort((ir1, ir2) {
      return ir1.player.compareTo(ir2.player);
    });
    return individualRecords;
  }

  /* 
   * 从 mappedBehavior 中删除某个根据 Id 选定的 Behavior 
   * 然后 Remap
   */
  List<MappedBehavior> deleteAndRemap(
    List<MappedBehavior> mappedBehaviors,
    Behavior behavior,
  ) {
    //var filterList = List<MappedBehavior>.from(mappedBehaviors);
    print('删完以前：${mappedBehaviors.length}');
    for (MappedBehavior mbh in mappedBehaviors) {
      print('扫描每一个mbh时的 mbh.turn：${mbh.turn}');
      print('扫描每一个mbh时的：behavior.turn ${behavior.turn}');
      if (mbh.turn == behavior.turn) {
        print('当找到该mbh时的mbh.turnBehaviors.length：${mbh.turnBehaviors.length}');
        //print('22删完以前列举：${mbh.turnBehaviors[0].describeTab} ${mbh.turnBehaviors[1].describeTab} ${mbh.turnBehaviors[2].describeTab}');
        mbh.turnBehaviors.removeWhere((bh) => bh.id == behavior.id);
        print('当找到该mbh时的mbh.turnBehaviors.length：${mbh.turnBehaviors.length}');
      }  
      break;   
    }
    mappedBehaviors.removeWhere((mbh) => mbh.turnBehaviors.length == 0);
    print('删完以后：${mappedBehaviors.length}');
    print('-------------------------------');
    return mappedBehaviors;
  }

  /* 
    * 从 IndividualRecords 中删除某个根据 Id选定的 Behavior 
    */
  List<IndividualRecord> regroupedIndividualRecordsAfterDelete(
    List<IndividualRecord> individualRecords,
    Behavior behavior,
  ) {
  //   var filterList = List<IndividualRecord>.from(individualRecords);
  //   for (IndividualRecord ir in filterList) {
  //     if (ir.player == behavior.player) {
  //       ir.indBehaviorTotal -= behavior.quantity;

  //       for (TurnRecord tr in ir.turnRecords) {
  //         if (tr.turn == behavior.turn) {
  //           tr.behaviors.removeWhere((bh) => bh.id == behavior.id);
  //         }
  //       }
  //       for (BehaviorRecord br in ir.behaviorRecords) {
  //         if (br.behaviorTag == behavior.describeTab) {
  //           br.behaviorQuantity -= behavior.quantity;
  //         }
  //       }
  //       if (ir.indBehaviorTotal == 0) {
  //         filterList.remove(ir);
  //       }
  //     }
  //   }
  //   double curMaxBehaviorTotal = 0;
  //   for (IndividualRecord ir in individualRecords) {
  //     curMaxBehaviorTotal = ir.indBehaviorTotal >= curMaxBehaviorTotal
  //         ? ir.indBehaviorTotal
  //         : curMaxBehaviorTotal;
  //   }
  //   for (IndividualRecord ir in individualRecords) {
  //     ir.maxBehaviorTotal = curMaxBehaviorTotal;
  //   }
  //   return filterList;
  }
}