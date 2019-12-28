import 'package:flutter/material.dart';

class Illutstration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo,
      alignment: Alignment.center,
      child: Text(
        '这里是放在下面的illustration',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}