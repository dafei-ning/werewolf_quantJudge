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
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.grey,
            height: widget.avaliableHeight * 0.75,
            alignment: Alignment.center,
            child: TableArea(),
          ),
          Container(
            color: Colors.indigo,
            height: widget.avaliableHeight * 0.20,
            alignment: Alignment.center,
            child: TableArea(),
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
