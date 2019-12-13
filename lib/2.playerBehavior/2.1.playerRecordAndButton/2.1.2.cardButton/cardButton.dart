import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.edit),
          tooltip: '删除此条记录',
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.delete),
          tooltip: '删除此条记录',
          onPressed: () {},
        ),
      ],
    );

    // return Container(
    //   width: 40,
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.end,
    //     children: <Widget>[
    //       Card(child: Text("修改")),
    //     ],
    //   ),
    // );
  }
}
