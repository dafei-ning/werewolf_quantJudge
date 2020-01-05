import 'package:flutter/material.dart';
import 'package:werewolf_quantjudge/models/category.dart';
import 'categoryItem.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

import '../data/simulatedData.dart';

class CatergoriesScreen extends StatelessWidget {
  List<Category> categories = SimulateData().categories;
  String title;
  
  CatergoriesScreen(this.title);

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget categoryBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(title),
          )
        : AppBar(
            title: Text(title),
          );
    var categorybody = SafeArea(
      child: GridView(
        padding: const EdgeInsets.all(15),
        children: categories
            .map((catData) => CategoryItem(
                  catData.title,
                  catData.color,
                ))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 2 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: categoryBar,
            child: categorybody,
          )
        : Scaffold(
            appBar: categoryBar,
            body: categorybody,
          );
  }
}
