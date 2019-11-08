import 'package:flutter/material.dart';

class PlayerBehaviorInfo extends StatelessWidget {

  final String title;
  final double quantity;
  final DateTime date;

  /*
   * Constructor
   */
  PlayerBehaviorInfo(this.title, this.quantity, this.date);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        // 2.1.2.1
        Container(child: Card(child: Text(title))),
        // 2.1.2.2
        Container(child: Card(child: Text(quantity.toString()))),
        // 2.1.2.3
        Container(child: Card(child: Text(date.toString()))),
      ],
    );
  }
}
