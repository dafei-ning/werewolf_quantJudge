import 'package:flutter/material.dart';

class Behavior {
  String id;
  int turn;
  int player;
  String describeTab;
  double quantity;
  DateTime date;
  List<String> side;

  Behavior({
    this.id,
    this.player,
    this.describeTab,
    this.quantity,
    this.date,
    this.turn,
  });

  Behavior.clone(Behavior behavior): super();
}
