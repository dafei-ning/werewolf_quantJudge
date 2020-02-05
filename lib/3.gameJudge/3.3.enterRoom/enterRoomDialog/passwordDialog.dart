import 'package:flutter/material.dart';

class PasswordDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: '请输入房间号',
        ),
      ),
    );
  }
}
