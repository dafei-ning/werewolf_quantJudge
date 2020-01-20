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
      eachSet.forEach((k, v) {

      });
      return Column(children: <Widget>[
        Text('${eachSet.entries.toString()} X '),
      ]);
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
