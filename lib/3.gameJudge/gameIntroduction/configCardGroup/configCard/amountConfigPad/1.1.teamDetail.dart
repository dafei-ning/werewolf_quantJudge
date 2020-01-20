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
    var title = Text(
      '${identity}',
      style: TextStyle(
        fontSize: 13,
        color: Colors.blueGrey,
        fontWeight: FontWeight.bold,
      ),
    );
    var setList = identitySet.map((eachSet) {
      List<Widget> wrapGroups = [];
      eachSet.forEach((k, v) {
        wrapGroups.add(Text('${k} 身份有 ${v} 张牌'));
      });
      return Column(
        children: <Widget>[
          Wrap(children: wrapGroups),
          SizedBox(
            height: 15,
          ),
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
