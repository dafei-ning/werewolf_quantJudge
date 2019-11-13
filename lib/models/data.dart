import './behavior.dart';
import './mappedBehavior.dart';

class SimulateData {
  List<MappedBehavior> get mappedBehaviors {
    List<MappedBehavior> mappedBehaviors = [
      MappedBehavior(
        turn: 1,
        turnBehaviors: [
          Behavior(
            turn: 1,
            id: 1,
            player: 1,
            title: "坐姿表情",
            quantity: 50,
            date: DateTime.now(),
          ),
          Behavior(
            turn: 1,
            id: 2,
            player: 1,
            title: "发言逻辑",
            quantity: 50,
            date: DateTime.now(),
          ),
          Behavior(
            turn: 1,
            id: 3,
            player: 2,
            title: "站边举票",
            quantity: 50,
            date: DateTime.now(),
          ),
          Behavior(
            turn: 1,
            id: 4,
            player: 3,
            title: "站边举票行为",
            quantity: 40,
            date: DateTime.now(),
          ),
        ],
      ),
      MappedBehavior(
        turn: 2,
        turnBehaviors: [
          Behavior(
            turn: 1,
            id: 1,
            player: 1,
            title: "坐姿表情2",
            quantity: 50,
            date: DateTime.now(),
          ),
          Behavior(
            turn: 1,
            id: 3,
            player: 2,
            title: "站边举票2",
            quantity: 50,
            date: DateTime.now(),
          ),
          Behavior(
            turn: 1,
            id: 4,
            player: 3,
            title: "站边举票行为2",
            quantity: 40,
            date: DateTime.now(),
          ),
        ],
      ),
      MappedBehavior(
        turn: 3,
        turnBehaviors: [
          Behavior(
            turn: 1,
            id: 1,
            player: 1,
            title: "坐姿表情3",
            quantity: 50,
            date: DateTime.now(),
          ),
          Behavior(
            turn: 1,
            id: 3,
            player: 2,
            title: "站边举票3",
            quantity: 50,
            date: DateTime.now(),
          ),
        ],
      ),
    ];
    return mappedBehaviors;
  }
}

final List<MappedBehavior> mappedBehaviors = [
  MappedBehavior(
    turn: 1,
    turnBehaviors: [
      Behavior(
        turn: 1,
        id: 1,
        player: 1,
        title: "坐姿表情",
        quantity: 50,
        date: DateTime.now(),
      ),
      Behavior(
        turn: 1,
        id: 2,
        player: 1,
        title: "发言逻辑",
        quantity: 50,
        date: DateTime.now(),
      ),
      Behavior(
        turn: 1,
        id: 3,
        player: 2,
        title: "站边举票",
        quantity: 50,
        date: DateTime.now(),
      ),
      Behavior(
        turn: 1,
        id: 4,
        player: 3,
        title: "站边举票行为",
        quantity: 40,
        date: DateTime.now(),
      ),
    ],
  ),
  MappedBehavior(
    turn: 2,
    turnBehaviors: [
      Behavior(
        turn: 1,
        id: 1,
        player: 1,
        title: "坐姿表情2",
        quantity: 50,
        date: DateTime.now(),
      ),
      Behavior(
        turn: 1,
        id: 3,
        player: 2,
        title: "站边举票2",
        quantity: 50,
        date: DateTime.now(),
      ),
      Behavior(
        turn: 1,
        id: 4,
        player: 3,
        title: "站边举票行为2",
        quantity: 40,
        date: DateTime.now(),
      ),
    ],
  ),
  MappedBehavior(
    turn: 3,
    turnBehaviors: [
      Behavior(
        turn: 1,
        id: 1,
        player: 1,
        title: "坐姿表情3",
        quantity: 50,
        date: DateTime.now(),
      ),
      Behavior(
        turn: 1,
        id: 3,
        player: 2,
        title: "站边举票3",
        quantity: 50,
        date: DateTime.now(),
      ),
    ],
  ),
];

final List<Behavior> behaviors = [
  Behavior(
    id: 1,
    player: 1,
    turn: 2,
    title: '坐姿状态',
    quantity: 50,
    date: DateTime.now(),
  ),
  Behavior(
    id: 2,
    player: 1,
    title: '发言逻辑',
    quantity: 30,
    date: DateTime.now(),
    turn: 1,
  ),
  Behavior(
    id: 3,
    player: 2,
    title: '站边举票',
    quantity: 20,
    date: DateTime.now(),
    turn: 1,
  ),
  Behavior(
    id: 4,
    player: 2,
    title: '站边举票',
    quantity: 20,
    date: DateTime.now(),
    turn: 2,
  ),
  Behavior(
    id: 5,
    player: 3,
    title: '站边举票行为',
    quantity: 20,
    date: DateTime.now(),
    turn: 3,
  ),
];
