import 'package:flutter/material.dart';

class TurnTitle extends StatelessWidget {
  final int turnNumber;
  
  /*
   * Constructor
   */
  TurnTitle(this.turnNumber);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      alignment: Alignment.center,
      child: Text(
        "第 ${turnNumber} 天",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
          color: Colors.grey,
        ),
      ),
    );
  }
}
