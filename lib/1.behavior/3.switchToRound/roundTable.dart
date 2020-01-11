import 'package:flutter/material.dart';
import '3.2.illustration.dart';
import '../switchButton.dart';
import '3.1.table/tableArea.dart';

class RoundTable extends StatefulWidget {
  final double avaliableHeight;
  final SwitchButton switchButtonBottom;
  RoundTable(this.avaliableHeight, this.switchButtonBottom);

  @override
  _RoundTable createState() => _RoundTable();
}

class _RoundTable extends State<RoundTable> {
  // demo number
  int playerAmount = 12;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: playerAmount < 9
          ? Container()
          : Column(
              children: <Widget>[
                // 这里放圆桌图
                Container(
                  color: Colors.grey,
                  height: widget.avaliableHeight * 0.75,
                  alignment: Alignment.center,
                  child: TableArea(playerAmount),
                ),
                // 这里放圆桌图的注释
                Container(
                  color: Colors.indigo,
                  height: widget.avaliableHeight * 0.20,
                  alignment: Alignment.center,
                  child: Illutstration(),
                ),
                Container(
                  height: widget.avaliableHeight * 0.05,
                  child: widget.switchButtonBottom,
                ),
              ],
            ),
    );
  }
}
