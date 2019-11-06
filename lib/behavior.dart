import 'package:flutter/material.dart';

class Behavior {
  String id;
  String title;
  double quantity;
  // Turns selector, use date widget to simulate.
  DateTime date;

  Behavior({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.date,
  });
}
