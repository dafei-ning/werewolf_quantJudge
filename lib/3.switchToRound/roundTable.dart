import 'package:flutter/material.dart';
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
              height: widget.avaliableHeight * 0.95,
              color: Colors.blue[600],
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Container(child: TableArea()),
                
                ],
              )),
          Container(
            height: widget.avaliableHeight * 0.05,
            child: widget.switchButtonBottom,
          ),
        ],
      ),
    );
  }
}
