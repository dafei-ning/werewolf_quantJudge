import 'package:flutter/material.dart';
import '../../../../../data/wolfDatabase.dart';

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
        fontSize: 14,
        color: Colors.pink[800],
        fontWeight: FontWeight.bold,
      ),
    );
    var setList = identitySet.map((eachSet) {
      List<Widget> wrapGroups = [];
      eachSet.forEach((k, v) {
        var charMap = WolfDataBase().characterMap;
        wrapGroups.add(
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                    text: ' ${charMap[k]} ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.tealAccent[700],
                    )),
                TextSpan(text: ' 有'),
                TextSpan(
                    text: ' ${v} ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: '张牌    '),
              ],
            ),
          ),
        );
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
