import 'package:flutter/material.dart';

class JudgeCateItem extends StatelessWidget {
  final String title;
  JudgeCateItem(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Text(title),
      color: Colors.teal[100],
    );
  }
}
