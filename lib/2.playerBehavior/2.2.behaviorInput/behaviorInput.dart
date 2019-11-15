import 'package:flutter/material.dart';

class BehaviorInput extends StatelessWidget {

  final Function inputFunction;
  /*
   * User input properties.
   */
  final turnInputController = TextEditingController();
  final behaviorInputController = TextEditingController();
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
              decoration: InputDecoration(labelText: '时间(天)'),
              //onChanged: (val) => turnInput = val,
              controller: turnInputController,
            ),
            TextField(
              decoration: InputDecoration(labelText: '行为标签'),
              //onChanged: (val) => behaviorInput = val,
              controller: behaviorInputController,
            ),
            TextField(
              decoration: InputDecoration(labelText: '分数'),
              //onChanged: (val) => scoreInput = val,
              controller: scoreInputController,
            ),
            FlatButton(
              child: Text(
                'Add Behavior',
                style: TextStyle(
                  color: Colors.red[400],
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                print(turnInputController.text);
                print(behaviorInputController.text);
                print(scoreInputController.text);
              },
            )
          ],
        ),
      ),
    );
  }
}
