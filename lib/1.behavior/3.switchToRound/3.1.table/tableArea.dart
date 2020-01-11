import 'package:flutter/material.dart';
import 'package:werewolf_quantjudge/1.behavior/3.switchToRound/3.1.table/playerSeat.dart';

class TableArea extends StatelessWidget {
  final int playerAmount;
  TableArea(this.playerAmount);

  @override
  Widget build(BuildContext context) {
    int playerAmountDemo = 12;
    return Container(
      child: ListView.builder(
        itemCount: playerAmountDemo,
        itemBuilder: (ctx, index) {
          return Container(
            child: PlayerSeat(index + 1),
          );
        },
      ),
    );
  }
}
