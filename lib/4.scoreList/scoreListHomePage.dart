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
            trailing: TabBar(
              tabs: [
                Tab(text: "个人纪录"),
                Tab(text: "湾区龙虎"),
                Tab(text: "信用记录"),
              ],
            ),
          )
        : AppBar(
            title: Text(title),
            bottom: TabBar(
              tabs: [
                Tab(text: "个人纪录"),
                Tab(text: "湾区龙虎"),
                Tab(text: "信用记录"),
              ],
            ),
          );

    PreferredSizeWidget meetupBar1 = AppBar(
            title: Text(title),
            bottom: TabBar(
              tabs: [
                Tab(text: "个人纪录"),
                Tab(text: "湾区龙虎"),
                Tab(text: "信用记录"),
              ],
            ),
          );

    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: meetupBar1,
        body: SafeArea(
          child: Center(
            child: Text('this is for ScoreList'),
          ),
        ),
      ),
    );
  }
}
