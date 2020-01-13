import 'package:flutter/material.dart';

class JudgeCateItem extends StatelessWidget {
  final String title;
  JudgeCateItem(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(title),
    );
  }
}
