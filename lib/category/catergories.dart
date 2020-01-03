import 'package:flutter/material.dart';
import 'package:werewolf_quantjudge/models/category.dart';
import 'categoryItem.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

import '../data/simulatedData.dart';

class CatergoriesScreen extends StatelessWidget {
  List<Category> categories = SimulateData().categories;

  @override
  Widget build(BuildContext context) {
     PreferredSizeWidget categoryBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(widget.title),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  child: Icon(CupertinoIcons.add_circled),
                  onTap: () => _startInputNewBehavior(context),
                ),
              ],
            ),
          )
        : AppBar(
            title: Text(widget.title),
            actions: <Widget>[
              IconButton(
                iconSize: 28,
                icon: Icon(Icons.add_box),
                onPressed: () => _startInputNewBehavior(context),
              )
            ],
          );
    var categorybody = GridView(
      children: categories
          .map((catData) => CategoryItem(
                catData.title,
                catData.color,
              ))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );

    return Scaffold(

      body: categorybody,
    );
  }
}
