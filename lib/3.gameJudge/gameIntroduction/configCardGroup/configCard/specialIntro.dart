import 'package:flutter/material.dart';

class SpecialIntro extends StatelessWidget {
  final List<Object> specials;
  SpecialIntro(this.specials);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: specials.map((special) {
          return Card(
            margin: EdgeInsets.only(top:40, bottom: 40, left: 15, right: 15),
            child: Text(special.toString()),);
        }).toList(),
      ),
    );
  }
}
