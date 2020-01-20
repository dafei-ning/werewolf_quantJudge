import 'package:flutter/material.dart';

class TeamDetail extends StatelessWidget {
  final String identity;
  final List<Map<Object, int>> identitySet;
  TeamDetail(this.identity, this.identitySet);

  @override
  Widget build(BuildContext context) {
    if (identitySet == null) {
      return null;
    }
    var title = Text('${identity}');
    var setList = identitySet.map((eachSet) {
      return null;
    }).toList();

    return Column(
      children: <Widget>[
        title,
      ],
    );
  }
}
