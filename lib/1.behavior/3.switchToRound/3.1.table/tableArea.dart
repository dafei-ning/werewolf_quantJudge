import 'package:flutter/material.dart';
import 'package:werewolf_quantjudge/1.behavior/3.switchToRound/3.1.table/playerSeat.dart';

class TableArea extends StatelessWidget {
  final int playerAmount;
  TableArea(this.playerAmount);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: playerAmount < 9
          ? Column()
          : ListView.builder(
              itemCount: playerAmount,
              itemBuilder: (ctx, index) {
                return Container(
                  child: PlayerSeat(index + 1),
                );
              },
            ),
    );
    // return Container(
    //   alignment: Alignment.center,
    //   child: Text(
    //     '这里是圆桌的区域，这个区域包含画的桌子和椅子',
    //     style: TextStyle(fontSize: 20),
    //   ),
    // );
  }
}
