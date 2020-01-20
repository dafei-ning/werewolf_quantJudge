import 'dart:html';

import 'package:flutter/material.dart';

class TeamDetail extends StatelessWidget {
  final String identity;
  final List<Map<Object, int>> identitySet;
  TeamDetail(this.identity, this.identitySet);

  @override
  Widget build(BuildContext context) {
    if (identitySet == null) {
      return Container();
    }
    var title = Text('${identity}');
    var setList = identitySet.map((eachSet) {
      return Column(
        children: <Widget>[
          SizedBox(height: 10),
          Container(
              child: Column(
            children: (eachSet as List<Entry>).map((entry) {
              return Text(entry.toString());
            }).toList(),
          ))
        ],
      );
    }).toList();

    return Column(
      children: <Widget>[
        title,
        Column(
          children: setList,
        )
      ],
    );
  }
}
