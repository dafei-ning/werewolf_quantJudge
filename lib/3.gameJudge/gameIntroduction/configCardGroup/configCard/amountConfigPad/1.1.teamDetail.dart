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
      List<Widget> wrapGroups = [];
      eachSet.forEach((k, v) {
        wrapGroups.add(Text('${k}身份有${v}人'));
      });
      return Container(child: Wrap(children: wrapGroups));
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
