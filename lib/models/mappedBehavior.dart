import 'package:flutter/material.dart';
import 'behavior.dart';

class MappedBehavior {
  int turn;
  List<Behavior> turnBehaviors;

  MappedBehavior({
    @required this.turn,
    @required this.turnBehaviors,
  });
}
