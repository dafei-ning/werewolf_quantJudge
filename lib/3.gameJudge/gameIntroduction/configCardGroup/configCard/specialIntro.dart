import 'package:flutter/material.dart';
import '../../../../models/gameIntroModel.dart';

class SpecialIntro extends StatelessWidget {
  final Object special1;
  final Object special2;
  SpecialIntro(this.special1, this.special2);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text("special1, special2"),
    );
  }
}
