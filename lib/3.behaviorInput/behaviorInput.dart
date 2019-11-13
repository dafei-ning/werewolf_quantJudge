import 'package:flutter/material.dart';

class BehaviorInput extends StatelessWidget {
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
            ),
            TextField(
              decoration: InputDecoration(labelText: '行为标签'),
            ),
            TextField(
              decoration: InputDecoration(labelText: '分数'),
            ),
            FlatButton(
              child: Text('Add Behavior',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  )),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
