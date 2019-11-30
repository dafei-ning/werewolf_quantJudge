import 'package:flutter/material.dart';

class Behavior {
  int id;
  int turn;
  int player;
  String describeTab;
  double quantity;
  // Turns selector, use date widget to simulate.
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
}
