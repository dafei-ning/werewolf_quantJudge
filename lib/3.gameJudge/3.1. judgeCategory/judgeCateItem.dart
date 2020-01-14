import 'package:flutter/material.dart';

class JudgeCateItem extends StatelessWidget {
  final String title;
  final Color color;
  JudgeCateItem(this.title, this.color);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Text(title),
      color: Colors.teal[100],
    );
  }
}
