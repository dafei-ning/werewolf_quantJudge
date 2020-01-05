import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class ScoreListHomePage extends StatelessWidget {
  static const routeName = '/score-list';
  final String title;

  ScoreListHomePage(this.title);

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget meetupBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(title),
          )
        : AppBar(title: Text(title));

    return Scaffold(
      appBar: meetupBar,
      body: SafeArea(
        child: Center(
          child: Text('this is for ScoreList'),
        ),
      ),
    );
  }
}