import 'package:flutter/material.dart';

class TableArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      alignment: Alignment.center,
      child: Text(
        '这里是圆桌的区域，这个区域包含画的桌子和椅子',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
