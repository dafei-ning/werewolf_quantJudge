import 'package:flutter/material.dart';

class SwitchButton extends StatelessWidget {
  final bool showRoundTable;
  final Function switchTheChart;
  SwitchButton(this.switchTheChart, this.showRoundTable);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '显示身份圆桌',
          style: Theme.of(context).textTheme.title,
        ),
        SizedBox(width: 5),
        Switch.adaptive(
          activeColor: Theme.of(context).accentColor,
          value: showRoundTable,
          onChanged: (val) {
            switchTheChart(val);
          },
        ),
      ],
    );
  }
}
