import '2.playerBehavior/behavior.dart';

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