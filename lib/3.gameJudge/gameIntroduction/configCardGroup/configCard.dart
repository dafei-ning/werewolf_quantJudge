import 'package:flutter/material.dart';

class ConfigCard extends StatelessWidget {
  final int playerAmount;
  final String config;
  ConfigCard(this.playerAmount, this.config);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('${playerAmount}人 ${config}'),
    );
  }
}