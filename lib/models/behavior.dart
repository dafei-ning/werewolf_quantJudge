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
    @required this.id,
    @required this.player,
    @required this.describeTab,
    @required this.quantity,
    @required this.date,
    this.turn,
  });
}
