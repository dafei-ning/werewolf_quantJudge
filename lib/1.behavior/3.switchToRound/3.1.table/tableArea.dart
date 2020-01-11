import 'package:flutter/material.dart';
import 'package:werewolf_quantjudge/1.behavior/3.switchToRound/3.1.table/playerSeat.dart';

class TableArea extends StatelessWidget {
  final int playerAmount;
  TableArea(this.playerAmount);

  @override
  Widget build(BuildContext context) {
    int playerAmountDemo = 1;
    return Container(
      child: playerAmountDemo < 9
          ? Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Text(
                  '人数没有达到游戏标准',
                  style: Theme.of(context).textTheme.subhead,
                ),
              ],
            )
          : ListView.builder(
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
