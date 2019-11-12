import 'package:flutter/material.dart';

class Behavior {
  int id;
  int turn;
  int player;
  String title;
  double quantity;
  // Turns selector, use date widget to simulate.
  DateTime date;
  List<String> side;
  
  Behavior({
    @required this.id,
    @required this.player,
    @required this.title,
    @required this.quantity,
    @required this.date,
    @required this.turn,
  });
}
