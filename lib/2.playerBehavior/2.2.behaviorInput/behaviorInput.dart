import 'package:flutter/material.dart';

class BehaviorInput extends StatelessWidget {
  final Function inputFunction;
  /*
   * User input properties.
   */
  final turnInputController = TextEditingController();
  final describeInputController = TextEditingController();
  final playerInputController = TextEditingController();
  final scoreInputController = TextEditingController();

  BehaviorInput(this.inputFunction);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: '玩家号码'),
              controller: playerInputController,
              keyboardType: TextInputType.number,
            ),
            TextField(
              decoration: InputDecoration(labelText: '天数轮次'),
              controller: turnInputController,
              keyboardType: TextInputType.number,
            ),
            TextField(
              decoration: InputDecoration(labelText: '行为标签'),
              controller: describeInputController,
              keyboardType: TextInputType.text,
            ),
            // TODO: 输入的分数将与其他玩家同样标签的分数值做比较
            TextField(
              decoration: InputDecoration(labelText: '分数'),
              controller: scoreInputController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            FlatButton(
              child: Text(
                '添加玩家行为评估',
                style: TextStyle(
                  color: Colors.red[400],
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                inputFunction(
                  int.parse(turnInputController.text),
                  int.parse(playerInputController.text),
                  describeInputController.text,
                  double.parse(scoreInputController.text),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
